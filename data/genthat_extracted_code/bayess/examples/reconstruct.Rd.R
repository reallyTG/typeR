library(bayess)


### Name: reconstruct
### Title: Image reconstruction for the Potts model with six classes
### Aliases: reconstruct
### Keywords: Menteith Potts model image reconstruction numerical
###   integration

### ** Examples

## Not run: 
##D data(Menteith)
##D lm3=as.matrix(Menteith)
##D #warning, this step is a bit lengthy
##D titus=reconstruct(20,lm3)
##D #allocation function
##D affect=function(u) order(u)[6]
##D #
##D aff=apply(titus$xcum,1,affect)
##D aff=t(matrix(aff,100,100))
##D par(mfrow=c(2,1))
##D image(1:100,1:100,lm3,col=gray(256:1/256),xlab="",ylab="")
##D image(1:100,1:100,aff,col=gray(6:1/6),xlab="",ylab="")
## End(Not run)


