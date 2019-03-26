library(trip)


### Name: sepIdGaps
### Title: Separate a set of IDs based on gaps
### Aliases: sepIdGaps
### Keywords: manip

### ** Examples



id <- gl(2, 8)
gd <- Sys.time() + 1:16
gd[c(4:6, 12:16)] <- gd[c(4:6, 12:16)] + 10000
sepIdGaps(id, gd, 1000)





