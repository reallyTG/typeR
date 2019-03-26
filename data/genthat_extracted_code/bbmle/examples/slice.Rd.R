library(bbmle)


### Name: slice
### Title: Calculate likelihood "slices"
### Aliases: slice sliceOld slicetrans slice1D slice2D
### Keywords: misc

### ** Examples

x <- 0:10
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
d <- data.frame(x,y)
fit1 <- mle2(y~dpois(lambda=exp(lymax)/(1+x/exp(lhalf))),
   start=list(lymax=0,lhalf=0),
   data=d)
s1 <- slice(fit1,verbose=FALSE)
s2 <- slice(fit1,dim=2,verbose=FALSE)
require(lattice)
plot(s1)
plot(s2)
## 'transect' slice, from best-fit values to another point
st <- slice(fit1,params2=c(5,0.5))
plot(st)



