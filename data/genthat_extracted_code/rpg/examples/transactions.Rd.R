library(rpg)


### Name: begin
### Title: Transaction support
### Aliases: begin commit rollback savepoint

### ** Examples

## Not run: 
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D sp1 = savepoint()
##D 
##D # nest savepoints
##D sp2 = savepoint()
##D data(mtcars)
##D write_table(mtcars, "testtab", overwrite = TRUE)
##D list_tables()
##D rollback(sp2)
##D 
##D list_tables()
##D # nest savepoints
##D sp3 = savepoint()
##D sp4 = savepoint()
##D write_table(mtcars, "testtab", overwrite = TRUE)
##D commit(sp4)
##D list_tables()
##D rollback(sp3)
##D list_tables()
##D 
##D rollback(sp1)
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




