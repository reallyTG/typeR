library(cancerTiming)


### Name: multidensity
### Title: plot multiple density functions on top of each other
### Aliases: multidensity

### ** Examples

x<-lapply(c(1,2,3),function(x){rnorm(100,mean=x)})
multidensity(x)



