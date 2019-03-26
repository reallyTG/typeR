library(asbio)


### Name: transM
### Title: Transition matrix analysis
### Aliases: transM anm.transM anm.TM.tck
### Keywords: graphs

### ** Examples

#Endangered cactus data data from Gurevitch et al. (2006)
A<-matrix(nrow=3,ncol=3,data=c(.672,0,.561,0.018,0.849,0,0,0.138,0.969),
byrow=TRUE)
init<-c(10,2,1)
transM(A,init,inter=100,stage.names=c("All","Sm. Juv.","Lg. Juv.","Adults"),
xlab="Years from present",ylab="n")
#animated version
## Not run: 
##D anm.transM(A,init,inter=100,stage.names=c("All","Sm. Juv.","Lg. Juv.","Adults"),
##D xlab="Years from present",ylab="n")
## End(Not run)



