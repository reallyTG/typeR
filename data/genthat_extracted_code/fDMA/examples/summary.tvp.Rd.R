library(fDMA)


### Name: summary.tvp
### Title: Summarizes Outcomes from 'tvp' Object.
### Aliases: summary.tvp

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
tvp <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99)
summary(tvp)



