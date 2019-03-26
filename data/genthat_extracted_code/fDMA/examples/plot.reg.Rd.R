library(fDMA)


### Name: plot.reg
### Title: Plots Selected Outcomes from 'reg' Object.
### Aliases: plot.reg

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D 
##D roll <- roll.reg(y=ld.wti,x=ld.drivers,window=100)
##D 
##D rec <- rec.reg(y=ld.wti,x=ld.drivers)
##D 
##D # graphics.off()
##D plot(roll)
##D 
##D # graphics.off()
##D plot(rec)
## End(Not run)



