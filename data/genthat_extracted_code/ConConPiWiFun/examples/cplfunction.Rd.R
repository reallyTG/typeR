library(ConConPiWiFun)


### Name: cplfunction
### Title: This class implements continuous convex piecewise linear
###   functions
### Aliases: cplfunction Suml cplfunction Rcpp_cplfunction-class
###   plot-methods plot,ANY-method plot,Rcpp_cplfunction-method InfConvl
###   show,Rcpp_cplfunction-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

##
#Construction of a piecewise linear function
##


Slopes=c(-1,2,Inf) # increasing ! convexity is required
Breakpoints=c(-Inf,2,4) # increasing. length is number of slopes +1
FirstNonInfBreakpointVal=3
CCPWLfunc1=new(cplfunction,Slopes,Breakpoints,FirstNonInfBreakpointVal)
plot(CCPWLfunc1) #visualisation method


###Etoile transformation (legendre transform of f)
# Changes f no return value
CCPWLfunc1$Etoile()
plot(CCPWLfunc1)  #if f = CCPWLfunc1 CCPWLfunc1 becomes is f^*(y) =inf_x {xy-f(x)}
CCPWLfunc1$Etoile()
plot(CCPWLfunc1)   ## (f^*)^* is f !


###Squeeze function 
# Changes f, no return value
left=-Inf; right=3
CCPWLfunc1$Squeeze(left,right) # CCPWLfunc1 is now infinite (or not definite) out of [left,right]
# i.e. all breakpoints out of [left,right] removed


###Swap function 
# Changes f  no return value !
y=2;
CCPWLfunc1$Swap(y)
plot(CCPWLfunc1); #now f = CCPWLfunc1 is replaced by x -> f(y-x) 


### Sum function (uses fast insertion) do not affect operands 
CCPWLfunc1=new(cplfunction,c(-1,2,Inf) ,c(-Inf,2,4),0)
CCPWLfunc2=new(cplfunction,c(-1,2,Inf),c(-Inf,1,3),0)
CCPWLfunc1plus2=Suml(CCPWLfunc1,CCPWLfunc2)
CCPWLfunc1plus2


par(mfrow=c(1,3))
plot(CCPWLfunc2,col='red'); 
plot(CCPWLfunc1,col='blue'); 
plot(CCPWLfunc1plus2);


rm(list=ls())
gc()




