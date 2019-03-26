library(StatDA)


### Name: plotellipse
### Title: Plot Ellipse
### Aliases: plotellipse
### Keywords: dplot univar

### ** Examples

data(moss)
Ba=log10(moss[,"Ba"])
Ca=log10(moss[,"Ca"])
plot.new()
plot.window(xlim=range(Ba),ylim=c(min(Ca)-1,max(Ca)))

x=cbind(Ba,Ca)
plotellipse(apply(x,2,mean),cov(x),perc=c(0.5,0.75,0.9,0.98))




