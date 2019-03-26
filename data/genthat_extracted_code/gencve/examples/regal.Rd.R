library(gencve)


### Name: regal
### Title: Regression EPE for All Implemented Methods
### Aliases: regal
### Keywords: models regression

### ** Examples

#about 200 seconds
## Not run: 
##D   data(prostate)
##D   X <- as.matrix.data.frame(prostate[,-9])
##D   y <- prostate[,9]
##D   system.time(m<-regal(X, y, MaxIter=1000, d=10, NCores=8, verboseQ=TRUE))[3]
##D   ind <- rev(order(m[,6]))
##D   dotchart(m[ind,6], pch=19, cex=0.5, bg=rgb(1,1,0,0.4),
##D        color="blue", main="CPU times")
## End(Not run)



