library(AGSDest)


### Name: typeIerr
### Title: type I error rate of a GSD
### Aliases: typeIerr
### Keywords: methods

### ** Examples

##The following calculates the type I error rate of a GSD.

GSD <- list(K=4,a=rep(-8,4),b=c(4.333,2.963,2.359,2.014),
t=c(0.25,0.5,0.75,1),Imax=0.22)

typeIerr(GSD)



