library(TSA)


### Name: prewhiten
### Title: Prewhiten a Bivariate Time Series, and Compute and Plot Their
###   Sample Cross-Correlation Function
### Aliases: prewhiten
### Keywords: methods

### ** Examples

data(milk)
data(electricity)
milk.electricity=ts.intersect(milk,log(electricity))
plot(milk.electricity,yax.flip=TRUE,main='') 
ccf(as.numeric(milk.electricity[,1]),as.numeric(milk.electricity[,2]),
main='milk & electricity',ylab='CCF')
me.dif=ts.intersect(diff(diff(milk,12)),diff(diff(log(electricity),12)))
prewhiten(as.numeric(me.dif[,1]),as.numeric(me.dif[,2]),
,ylab='CCF' )



