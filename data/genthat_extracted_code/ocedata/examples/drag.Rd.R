library(ocedata)


### Name: drag
### Title: Wind drag coefficient
### Aliases: drag
### Keywords: datasets

### ** Examples

## Not run: 
##D library(ocedata)
##D data(drag)
##D par(mar=c(3,3,1,1), mgp=c(2, 0.7, 0))
##D plot(drag$U, drag$Cd, pch=ifelse(drag$method == "profile", 1, 19),
##D      xlab="U [m/s]", ylab=expression(C[D]),
##D      xlim=c(0, 22), ylim=c(0, 3e-3))
##D legend("topleft", pch=c(1,19), legend=c("profile method", "eddy covariance method"))
## End(Not run)



