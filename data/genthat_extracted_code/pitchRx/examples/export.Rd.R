library(pitchRx)


### Name: export
### Title: Export (append) a data.frame to a remote table in a database.
### Aliases: export

### ** Examples

## Not run: 
##D library(dplyr)
##D my_db <- src_sqlite("DB.sqlite3")
##D data(pitches, package="pitchRx")
##D # Creates the 'pitches' table in the database
##D export(connect=my_db$con, value=pitches, name="pitches")
##D # Appends to the 'pitches' tables, but with the first column missing
##D export(connect=my_db$con, value=pitches[,-1], name="pitches")
##D tail(data.frame(collect(tbl(my_db, "pitches")))) #verify it appends correctly
##D # This data frame has a column that doesn't exist in the pitches table --
##D # so a new table is created.
##D export(connect=my_db$con, value=cbind(pitches, test="works"), name="pitches")
## End(Not run)



