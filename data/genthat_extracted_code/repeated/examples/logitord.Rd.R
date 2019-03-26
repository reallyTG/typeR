library(repeated)


### Name: logitord
### Title: Ordinal Random Effects Models with Dropouts
### Aliases: logitord logitord.print
### Keywords: models

### ** Examples


y <- trunc(runif(20,max=4))
id <- gl(4,5)
age <- rpois(20,20)
times <- rep(1:5,4)
logitord(y, id=id, out.ccov=~age, drop.ccov=age, pout=c(1,0,0),
	pdrop=c(1,0))
logitord(y, id, tvcov=times, pout=c(1,0,0), pdrop=c(1,0))




