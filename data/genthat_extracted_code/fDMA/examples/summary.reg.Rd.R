library(fDMA)


### Name: summary.reg
### Title: Summarizes Outcomes from 'reg' Object.
### Aliases: summary.reg

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
roll <- roll.reg(y=ld.wti,x=ld.drivers,window=100)
rec <- rec.reg(y=ld.wti,x=ld.drivers)
summary(roll)
summary(rec)



