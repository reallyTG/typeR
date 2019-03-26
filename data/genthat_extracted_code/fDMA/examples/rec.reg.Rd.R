library(fDMA)


### Name: rec.reg
### Title: Computes Recursive Regression.
### Aliases: rec.reg

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
rec1 <- rec.reg(y=ld.wti,x=ld.drivers)
rec2 <- rec.reg(y=ld.wti)



