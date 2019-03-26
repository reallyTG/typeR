library(mppa)


### Name: place
### Title: Function to place a point on a period-by-period plot generated
###   by 'plot,mproc-method'
### Aliases: place

### ** Examples

#### A has a daily pattern: its intensity is a sinusoidal curve lambda(t) = 1+sin(2*pi*t)
start=0; end=365 #A year
##the cumulative intensity is 
F=function(t){
    t%/%1+t%%1+(1-cos(2*pi*t%%1))/(2*pi)
}
##Dropping 365 A and B points according to F
A=sapply(runif(365), function(u){uniroot(function(x) F(x)/365-u, interval=c(0,365))$root})
m=mp(A,start=start, end=end)
##This plots A in a period by period plot
## Not run: plot(m, period=1)
##The middle of the day in the middle of the year:
x=365/2
## Not run: place(x,m, period=1, col="red", pch=8, cex=10)



