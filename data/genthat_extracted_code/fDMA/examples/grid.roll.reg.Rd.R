library(fDMA)


### Name: grid.roll.reg
### Title: Computes 'roll.reg' Function for Multiple Values of 'window'.
### Aliases: grid.roll.reg

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D grw <- c(50,100,150)
##D g <- grid.roll.reg(y=ld.wti,x=ld.drivers,grid.window=grw)
##D 
##D # extract model with window=100
##D model <- g$models[[2]]
## End(Not run)



