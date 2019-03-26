library(fDMA)


### Name: roll.reg
### Title: Computes Rolling Regression.
### Aliases: roll.reg

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
roll1 <- roll.reg(y=ld.wti,x=ld.drivers,window=100)
roll2 <- roll.reg(y=ld.wti,window=100)



