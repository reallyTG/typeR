library(meboot)


### Name: expand.sd
### Title: Expand the Standard Deviation of Resamples
### Aliases: expand.sd
### Keywords: ts

### ** Examples
    
    set.seed(345)
    out <- meboot(x=AirPassengers, reps=100, trim=0.10, reachbnd=FALSE, elaps=TRUE) 
    exp.ens <- expand.sd(x=AirPassengers, out$ensemble)
  


