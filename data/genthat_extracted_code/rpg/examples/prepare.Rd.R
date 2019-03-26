library(rpg)


### Name: prepare
### Title: Prepared queries
### Aliases: prepare

### ** Examples

## Not run: 
##D # try connecting to default database
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D 
##D # write data frame contents
##D data(mtcars)
##D write_table(mtcars)
##D 
##D # delete the rows
##D query("truncate mtcars")
##D read_table(mtcars)
##D 
##D # use prepare-execute to write rows
##D pars = paste0("$", 1:11, collapse = ", ")
##D sql = paste0("INSERT INTO mtcars VALUES (", pars, ")", collapse = " ")
##D f = prepare(sql)
##D f(mtcars)
##D read_table(mtcars, limit = 5)
##D 
##D # cleanup
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




