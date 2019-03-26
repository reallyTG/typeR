library(MonetDBLite)


### Name: mdbapply
### Title: Apply a R function to an external MonetDB table.
### Aliases: mdbapply mdbapply,MonetDBConnection-method

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(MonetDB.R(), "demo")
##D data(mtcars)
##D dbWriteTable(con, "mtcars", mtcars)
##D 
##D mpgplus42 <- mdbapply(con, "mtcars", "double", function(d) {
##D 	d$mpg + 42
##D })
## End(Not run)


