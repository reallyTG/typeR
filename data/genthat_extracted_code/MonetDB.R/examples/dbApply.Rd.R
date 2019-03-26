library(MonetDB.R)


### Name: mdbapply
### Title: Apply a R function to a MonetDB table.
### Aliases: mdbapply mdbapply,MonetDBConnection-method

### ** Examples

## Not run: 
##D conn <- dbConnect(MonetDB.R(), "demo")
##D data(mtcars)
##D dbWriteTable(conn, "mtcars", mtcars)
##D 
##D mpgplus42 <- mdbapply(conn, "mtcars", "double", function(d) {
##D 	d$mpg + 42
##D })
## End(Not run)


