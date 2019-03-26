library(MonetDB.R)


### Name: control
### Title: Control a MonetDB server from the R shell.
### Aliases: control monetdb.server.setup monetdb.server.start
###   monetdb.server.stop monetdb.server.shutdown monetdb.server.getpid

### ** Examples

## Not run: 
##D startscript <- monetdb.server.setup("/tmp/database","/usr/local/monetdb/", "db1", 50001)
##D pid <- monetdb.server.start(startscript)
##D monetdb.server.stop(pid)
##D conn <- dbConnect(MonetDB.R(), "monetdb://localhost:50001/db1")
## End(Not run)


