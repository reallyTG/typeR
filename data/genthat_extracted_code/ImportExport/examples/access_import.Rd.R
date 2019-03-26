library(ImportExport)


### Name: access_import
### Title: Import tables and queries from Microssoft Office Access(.mdb)
### Aliases: access_import
### Keywords: access import

### ** Examples


## Not run: 
##D x<-access_import(file="mydata.mdb",
##D                     table_names=c("table1","table2",
##D                     "Select * From table1 inner join table2 on table.var1=table2.var2","table3")
##D                     ,where_sql=c(3))
##D 
## End(Not run)




