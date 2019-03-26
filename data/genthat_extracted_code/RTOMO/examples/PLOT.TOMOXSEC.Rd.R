library(RTOMO)


### Name: PLOT.TOMOXSEC
### Title: Plot a tomographic cross section
### Aliases: PLOT.TOMOXSEC
### Keywords: hplot

### ** Examples

data(HELMOD)

### after L = locator(2)
L=list()
L$x=c( 4.21883807095,23.99298268599)
L$y=c(15.8014536521,11.4951858659)

###  create the cross section:
XZ = TOMOXSEC(HELMOD, L$x[1], L$y[1], L$x[2],  L$y[2] , zmax=20, COL=tomo.colors(100), PLOT=FALSE)


###  Now plot the cross section
PLOT.TOMOXSEC(XZ)




