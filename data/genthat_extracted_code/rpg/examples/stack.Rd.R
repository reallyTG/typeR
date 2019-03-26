library(rpg)


### Name: push_conn
### Title: Multiple PostgreSQL connections
### Aliases: push_conn pop_conn swap_conn rotate_stack show_conn_stack

### ** Examples

## Not run: 
##D # make some databases
##D dbs = paste0("rpgdb", 1:3)
##D lapply(paste("createdb", dbs), system)
##D 
##D # connect
##D connect(dbname = dbs[1]); push_conn()
##D connect(dbname = dbs[2]); push_conn()
##D connect(dbname = dbs[3]); push_conn()
##D 
##D show_conn_stack()
##D rotate_stack()
##D show_conn_stack()
##D rotate_stack(2)
##D show_conn_stack()
##D pop_conn()
##D show_conn_stack()
##D get_conn_info("dbname")
##D swap_conn()
##D show_conn_stack()
##D get_conn_info("dbname")
##D pop_conn()
##D show_conn_stack()
##D pop_conn()
##D show_conn_stack()
##D disconnect()
##D connect()
##D lapply(paste("dropdb", dbs), system)
## End(Not run)




