library(adaptTest)


### Name: plotCEF
### Title: Function to plot a conditional error function
### Aliases: plotCEF

### ** Examples

## Plot two conditional error functions of the Lehmacher-Wassmer (1999) type:
## one to the local level alpha2=0.1, and one that runs through (p1,p2)=(0.3,0.7)
plotCEF(typ="l", a2=0.1, add=FALSE)
plotCEF(typ="l", p1=0.3, p2=0.7)

## Plot an explicitly defined conditional error function, and distort it
plotCEF(fun=function(x) ifelse(x<.5,(1-x)^2, (1-x)/2), add=FALSE)
plotCEF(fun=function(x) ifelse(x<.5,(1-x)^2, (1-x)/2), dis="pl", a2=.5)
foo <- CEF(fun=function(x) ifelse(x<.5,(1-x)^2, (1-x)/2), dis="pl", a2=.5)
plotCEF(fun=foo, col="red")



