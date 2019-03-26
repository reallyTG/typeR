library(qdap)


### Name: end_inc
### Title: Test for Incomplete Sentences
### Aliases: end_inc
### Keywords: incomplete

### ** Examples

## Not run: 
##D dat <- sentSplit(DATA, "state", stem.col = FALSE)
##D dat$state[c(2, 5)] <- paste(strip(dat$state[c(2, 5)]), "|")
##D end_inc(dat, "state")
##D end_inc(dat, "state", warning.report = FALSE)
##D end_inc(dat, "state", which.mode = TRUE)
## End(Not run)



