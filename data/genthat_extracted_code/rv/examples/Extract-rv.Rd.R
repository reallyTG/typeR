library(rv)


### Name: Extract-rv
### Title: Extract or Replace Parts of a Random Vector
### Aliases: Extract-rv [.rv [.rvfactor [.rvsummary [<-.rv [<-.rvsummary
###   impute<-
### Keywords: classes

### ** Examples


  x <- rvnorm(1)
  y <- (1:5)
  ## Not run: 
##D      y[2] <- x ## Will not work
##D   
## End(Not run)
  impute(y, 2) <- x




