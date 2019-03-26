library(rpg)


### Name: write_table
### Title: PostgreSQL data frame IO
### Aliases: write_table read_table

### ** Examples

## Not run: 
##D # connect using defaults
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D  
##D # write data frame contents
##D data(mtcars)
##D write_table(mtcars)
##D 
##D # make "cyl" primary key (will fail unique constraint)
##D write_table(mtcars, pkey = "cyl", overwrite = TRUE)
##D 
##D # also write row names to "id"
##D write_table(mtcars, row_names = "id", overwrite = TRUE)
##D 
##D # row names as primary key
##D write_table(mtcars, row_names = "id", pkey = "id", overwrite = TRUE)
##D 
##D # default R row names and only first 3 columns
##D read_table("mtcars", what = "mpg, cyl, disp", limit = 3)
##D 
##D # row names from column "id"
##D read_table("mtcars", row_names = "id", limit = 3)
##D 
##D # get row names from primary key
##D read_table("mtcars", pkey_to_row_names = TRUE, limit = 3)
##D 
##D #cleanup
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




