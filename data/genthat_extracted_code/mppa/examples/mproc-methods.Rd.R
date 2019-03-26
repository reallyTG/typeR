library(mppa)


### Name: plot-methods
### Title: Methods for function 'plot' in package 'mproc'
### Aliases: plot-methods plot,mproc-method
### Keywords: methods

### ** Examples

A = c(.1, .2, .3)
B = c(.1, .2, .3)
##Giving the last point in B a different colour from the rest
## Not run: plot(mp(list(A=A,B=B)), mks=list(c(1,1,1), c(1,1,2)))

#### A and B have a common daily pattern:
### their intensity is a sinusoidal curve lambda(t) = 1+sin(2*pi*t)
start=0; end=365 #A year
##the cumulative intensity is 
F=function(t){
    t%/%1+t%%1+(1-cos(2*pi*t%%1))/(2*pi)
}
##Dropping 365 A and B points according to F
A=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
B=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
##This plots A and B
## Not run: plot(mp(A,B, start=start, end=end), pch=".")

##This plots B, one day represented on each horizontal line
## Not run: plot(mp(A,B, start=start, end=end), period=1, id=2)

##Same as above, but now colouring the seventh day of every week differently:
## Not run: plot(mp(A,B, start=start, end=end), period=1, id=2,mks=round(B%%7)==6)
##Now A and B are in the same plot, different colour
lA=length(A); lB=length(B); 
## Not run: plot(mp(c(A,B),start=start,end=end),period=1,mks=c(rep(1,lA), rep(2,lB)))



