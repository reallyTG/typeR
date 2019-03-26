library(cwhmisc)


### Name: cwhmisc-package
### Title: cwhmisc
### Aliases: cwhmisc-package cwhmisc
### Keywords: package math character data manip print utilities hplot

### ** Examples

## Not run: 
##D  #  Show use of 'SplomT'
##D   nr <- 100; nc <- 8;
##D   data <- as.data.frame(matrix(rnorm(nr*nc),nrow=nr,ncol=nc))
##D   data[,nc]   <- data[,nc-2] + 0.3*data[,nc-1] #generate higher correlations
##D   data[,nc-1] <- data[,nc-1] + 0.9*data[,nc]
##D   colnames(data)<-paste("vw",letters[1:nc],sep="")
##D #  splom(~data,cex=0.2)
##D   try( SplomT(data,mainL="SplomT with random data",hist="d",cex.diag=0.6,hist.col="green") )
## End(Not run)



