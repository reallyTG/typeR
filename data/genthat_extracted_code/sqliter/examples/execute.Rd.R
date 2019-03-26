library(sqliter)


### Name: execute
### Title: execute query into a given database
### Aliases: execute execute.sqliter

### ** Examples

## Not run: 
##D DBM <- sqliter(path=c("data", "another/project/data"))
##D ds <- execute(DBM, "dummydatabase", "select count(*) from dummytable")
##D ds <- execute(DBM, "dummydatabase", "select * from dummytable where
##D       name = :name", name=c("Macunamima", "Borba Gato"))
##D ds <- execute(DBM, "dummydatabase", "select * from dummytable where
##D       name = :name", name=c("Macunamima", "Borba Gato"),
##D         post_proc=function(ds) {
##D ds <- transform(ds, birthday=as.Date(birthday))
##D ds
##D })
## End(Not run)



