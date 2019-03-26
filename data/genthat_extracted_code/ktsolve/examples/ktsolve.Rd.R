library(ktsolve)


### Name: ktsolve
### Title: Configurable function for solving families of nonlinear
###   equations Version: 1.0
### Aliases: ktsolve

### ** Examples

zfunc<-function(x) {
	z<-vector()
z[1]<- 4*var1 -3*var2 +5*var3
z[2]<-8*var1 +5*var2 -2*var3
z
}

 known=list(var2=5)
 guess=list(var1=2,var3=0)
 solv1 <- ktsolve(zfunc,known=known,guess=guess)
#   Successful convergence.
# solution is:
#      var1      var3 
# -1.979167  4.583333 
# "known" inputs were:
#       var2
# known 5  
 eval(solv1$yfunc)(solv1$results$par)

 
 known=list(var1=5)
 guess=list(var2=2,var3=0)
 solv2<- ktsolve(zfunc,known=known,guess=guess)
#   Successful convergence.
# solution is:
#      var2      var3 
# -12.63158 -11.57895 
# "known" inputs were:
#       var1
# known 5   
eval(solv2$yfunc)(solv2$results$par)
 


