library(fDMA)


### Name: print.reg
### Title: Prints 'reg' Object.
### Aliases: print.reg

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
roll <- roll.reg(y=ld.wti,x=ld.drivers,window=100)
rec <-  rec.reg(y=ld.wti,x=ld.drivers)
print(roll)
print(rec)



