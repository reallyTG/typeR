library(dae)


### Name: fac.match
### Title: Match, for each combination of a set of columns in 'x', the row
###   that has the same combination in 'table'
### Aliases: fac.match
### Keywords: design factor

### ** Examples
## Not run: 
##D #A single unmatched combination
##D kdata <- data.frame(Expt="D197-5", 
##D                     Row=8, 
##D                     Column=20, stringsAsFactors=FALSE)
##D index <- fac.match(kdata, D197.dat, c("Expt", "Row", "Column"))
##D 
##D # A matched and an unmatched combination
##D kdata <- data.frame(Expt=c("D197-5", "D197-4"), 
##D                     Row=c(8, 10), 
##D                     Column=c(20, 8), stringsAsFactors=FALSE)
##D index <- fac.match(kdata, D197.dat, c("Expt", "Row", "Column"))
## End(Not run)


