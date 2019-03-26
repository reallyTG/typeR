library(ibmdbR)


### Name: idaQuery, idaScalarQuery
### Title: Run an SQL query on the database
### Aliases: idaQuery idaScalarQuery

### ** Examples

## Not run: 
##D #idaScalarQuery returns a single value
##D v <- idaScalarQuery("SELECT COUNT(*) FROM IRIS")
##D 
##D #idaQuery returns a data.frame
##D df <- idaQuery("SELECT * FROM IRIS")
##D 
##D #idaQuery and idaScalarQuery automatically paste all arguments into a single query
##D #This is convenient if you use variables
##D 
##D tableName <- "IRIS"
##D df <- idaScalarQuery("SELECT COUNT(*) FROM ",tableName)
## End(Not run)



