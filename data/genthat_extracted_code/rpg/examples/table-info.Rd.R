library(rpg)


### Name: list_tables
### Title: PostgreSQL database information
### Aliases: list_tables describe_table list_schema list_databases

### ** Examples

## Not run: 
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D  
##D # write data frame contents
##D data(mtcars)
##D write_table(mtcars)
##D  
##D # get some information
##D list_tables()
##D describe_table("mtcars")
##D list_schema()
##D list_databases()
##D 
##D #cleanup
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




