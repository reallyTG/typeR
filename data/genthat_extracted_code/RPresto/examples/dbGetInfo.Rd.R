library(RPresto)


### Name: dbGetInfo,PrestoDriver-method
### Title: Metadata about database objects
### Aliases: dbGetInfo,PrestoDriver-method
###   dbGetInfo,PrestoConnection-method dbGetInfo,PrestoResult-method

### ** Examples

## Not run: 
##D   conn <- dbConnect(Presto(), 'localhost', 7777, 'onur', 'datascience')
##D   result <- dbSendQuery(conn, 'SELECT * FROM jonchang_iris')
##D   iris <- data.frame()
##D   progress.bar <- NULL
##D   while (!dbHasCompleted(result)) {
##D     chunk <- dbFetch(result)
##D     if (!NROW(iris)) {
##D       iris <- chunk
##D     } else if (NROW(chunk)) {
##D       iris <- rbind(iris, chunk)
##D     }
##D     stats <- dbGetInfo(result)[['stats']]
##D     if (is.null(progress.bar)) {
##D       progress.bar <- txtProgressBar(0, stats[['totalSplits']], style=3)
##D     } else {
##D       setTxtProgressBar(progress.bar, stats[['completedSplits']])
##D     }
##D   }
##D   close(progress.bar)
## End(Not run)



