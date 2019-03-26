library(flock)


### Name: flock-package
### Title: Process synchronization using file locks.
### Aliases: flock-package flock
### Keywords: package

### ** Examples

## Not run: 
##D require(DBI)
##D require(flock)
##D require(RSQLite)
##D require(parallel)
##D 
##D dbpath <- tempfile()
##D con <- dbConnect(RSQLite::SQLite(), dbname=dbpath)
##D df <- data.frame(value = 0)
##D dbWriteTable(con, "test", df)
##D dbDisconnect(con)
##D 
##D write.one.value <- function(val, lock.name=NULL) {
##D    if(!is.null(lock.name)) {
##D       file.lock = lock(lock.name)
##D    }
##D    
##D    # The three lines below are the "critical section"
##D    con <- dbConnect(RSQLite::SQLite(), dbname = dbpath)
##D    dbWriteTable(con, "test", data.frame(value = val), append = TRUE)
##D    dbDisconnect(con)
##D    
##D    if(!is.null(lock.name)) {
##D       unlock(file.lock)
##D    }
##D }
##D 
##D lock.name = tempfile()
##D 
##D # Run the parallel database updates with two cores
##D mclapply(1:100, write.one.value, mc.cores=2, lock.name=lock.name)
##D 
##D # To see the failing scenario, run (on a multi-core system):
##D # mclapply(1:100, write.one.value, mc.cores=2)
## End(Not run)



