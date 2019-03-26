library(primer)


### Name: hanski
### Title: Core-satellite Metapopulation Model
### Aliases: hanski
### Keywords: methods

### ** Examples

prms <- c(ci<- 0.15, e=0.05)
out <- ode(y=.2, times=1:100, func=hanski, parms=prms )
matplot(out[,1], out[,2], type='l', ylab="p", xlab="time")



