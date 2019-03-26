library(divDyn)


### Name: shades
### Title: Quantile plot of time series
### Aliases: shades

### ** Examples

# some random values accross the Phanerozoic
data(stages)
tsplot(stages, boxes="sys", shading="series", ylim=c(-5,5), ylab=c("normal distributions"))
  randVar <- t(sapply(1:95, FUN=function(x){rnorm(150, 0,1)}))
  shades(stages$mid, randVar, col="blue", res=10,method="symmetric")
  
# a bottom-bounded distribution (log normal)
tsplot(stages, boxes="sys", shading="series", ylim=c(0,30), ylab="log-normal distributions")
  randVar <- t(sapply(1:95, FUN=function(x){rlnorm(150, 0,1)}))
  shades(stages$mid, randVar, col="blue", res=c(0,0.33, 0.66, 1),method="decrease")	 



