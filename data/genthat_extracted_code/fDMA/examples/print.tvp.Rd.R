library(fDMA)


### Name: print.tvp
### Title: Prints 'tvp' Object.
### Aliases: print.tvp

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
tvp <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99)
print(tvp)



