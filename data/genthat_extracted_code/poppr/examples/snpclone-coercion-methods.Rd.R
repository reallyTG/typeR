library(poppr)


### Name: as.snpclone
### Title: Create a snpclone object from a genlight object.
### Aliases: as.snpclone as.snpclone,genlight-method

### ** Examples

(x <- as.snpclone(glSim(100, 1e3, ploid=2)))
## Not run: 
##D # Without parallel processing
##D system.time(x <- as.snpclone(glSim(1000, 1e5, ploid=2)))
##D 
##D # With parallel processing... doesn't really save you much time.
##D system.time(x <- as.snpclone(glSim(1000, 1e5, ploid=2, parallel = TRUE), 
##D                              parallel = TRUE))
## End(Not run)




