library(ConConPiWiFun)


### Name: cpqfunction
### Title: This class implements continuous convex piecewise quadratic
###   functions
### Aliases: cpqfunction Sumq InfConvq cpqfunction Rcpp_cpqfunction-class
###   show-methods show,ANY-method show,Rcpp_cpqfunction-method
### Keywords: ~kwd1 ~kwd2

### ** Examples


##
#Construction of a piecewise quadratic function
##
Slopes1=c(-1,2) 
Slopes0=c(-2,0)# increasing ! convexity is required
Breakpoints=c(-Inf,2,4) # increasing. length is number of slopes +1
FirstNonInfBreakpointVal=3
CCPWLfunc1=new(cpqfunction,Slopes0,Slopes1,Breakpoints,FirstNonInfBreakpointVal)
CCPWLfunc1$get_BreakPoints_() ## return Breaks AND Slopes
plot(CCPWLfunc1)

###Etoile transformation (legendre transform of f)
# Changes f no return value
CCPWLfunc1$Etoile()
CCPWLfunc1$get_BreakPoints_()
CCPWLfunc1$Etoile()
CCPWLfunc1$get_BreakPoints_()  ## (f^*)^* is f !


###Squeeze function 
# Changes f, no return value
left=-1; right=4
CCPWLfunc1$Squeeze(left,right) # CCPWLfunc1 is now infinite (or not definite) out of [left,right]
# i.e. all breakpoints out of [left,right] removed
CCPWLfunc1$get_BreakPoints_() 

###Swap function 
# Changes f  no return value !
y=2;
CCPWLfunc1$Swap(y)
CCPWLfunc1$get_BreakPoints_() #now f = CCPWLfunc1 is replaced by x -> f(y-x) 


### Sum function (uses fast insertion) do not affect operands 
CCPWLfunc1=new(cpqfunction,Slopes0,Slopes1,Breakpoints,FirstNonInfBreakpointVal)
CCPWLfunc2=new(cpqfunction,Slopes0,Slopes1+1,Breakpoints,FirstNonInfBreakpointVal)
CCPWLfunc1plus2=Sumq(CCPWLfunc1,CCPWLfunc2)
CCPWLfunc1plus2$get_BreakPoints_()


rm(list=ls())
gc()




