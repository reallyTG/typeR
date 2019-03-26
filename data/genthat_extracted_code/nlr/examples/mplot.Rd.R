library(nlr)


### Name: mplot
### Title: Multiple Plot
### Aliases: mplot
### Keywords: Multiple plot

### ** Examples

datalist<-list(xr=trade.ir[,1],yr=trade.ir[,2])
a1<- nlr(nlrobj5[[18]],data=datalist,
control=nlr.control(trace=TRUE,derivfree = FALSE,tolerance=1e-4,singularCase=1,maxiter = 8000))    
a2<- nlr(nlrobj5[[18]],data=datalist,
control=nlr.control(trace=TRUE,method="OLS",
derivfree = FALSE,tolerance=1e-4,maxiter = 4000))    # nelder mead, MM, selfstart

mlist=list(a1,a2)
mplot(mlist)



