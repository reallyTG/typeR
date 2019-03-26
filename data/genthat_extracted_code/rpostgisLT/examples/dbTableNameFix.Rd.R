library(rpostgisLT)


### Name: dbTableNameFix
### Title: Format input for database schema/table names.
### Aliases: dbTableNameFix
### Keywords: internal

### ** Examples

## Not run: 
##D name<-c("schema","table")
##D dbTableNameFix(conn,name)
##D 
##D #current search path schema is added to single-length character object (if only table is given)
##D name<-"table"
##D dbTableNameFix(conn,name)
##D 
##D #schema or table names with double quotes should be given exactly as they are 
##D (make sure to wrap in single quotes in R):
##D name<-c('sch"ema','"table"')
##D dbTableNameFix(conn,name)
## End(Not run)



