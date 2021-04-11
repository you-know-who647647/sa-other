.POSIX:

schemas = ga_user ga_history ga_podcasts ga_books

all: $(schemas)

$(schemas):
	mysql --user $$(whoami) --host localhost --port 3306 --protocol=tcp --execute="create schema if not exists $@;"
	migrate -database "mysql://$$(whoami)@tcp(localhost:3306)/$@" -path $@/migrations up

.PHONY: $(schemas)
