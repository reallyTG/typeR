library(gamlss)


### Name: centiles
### Title: Plots the centile curves for a GAMLSS object
### Aliases: centiles centiles.fan
### Keywords: regression

### ** Examples

data(abdom)
h<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom) 
# default plot
centiles(h,xvar=abdom$x)
# control of colours and lines
centiles(h, xvar=abdom$x,  col.cent=c(2,3,4,5,1,5,4,3,2,1), 
              lwd.cent=c(1,1,1,1,2,1,1,1,1))
#Control line types
centiles(h, xvar=abdom$x,  col.cent=1, cent=c(.5,2.5,50,97.5,99.5), 
              lty.centiles=c(3,2,1,2,3),lwd.cent=c(1,1,2,1,1))
# control of the main title
centiles(h, xvar=abdom$x,  main="Abdominal data \n @")
# the fan-chart
centiles.fan(h,xvar=abdom$x, colors="rainbow")
rm(h)



