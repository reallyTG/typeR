library(rpg)


### Name: result_dim
### Title: PostgreSQL query
### Aliases: result_dim get_tuple_info query query_error fetch execute

### ** Examples

## Not run: 
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D execute("DROP SCHEMA IF EXISTS rpgtesting CASCADE")
##D execute("CREATE SCHEMA rpgtesting")
##D execute("SET search_path TO rpgtesting")
##D execute("DROP TABLE IF EXISTS test")
##D execute("CREATE TABLE test (id integer, field text)")
##D query("INSERT INTO test VALUES ($1, $2)", c(1, "test"))
##D fetch("SELECT * FROM test")
##D result_dim()
##D fetch("SELECT * FROM testing")
##D query_error()
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




