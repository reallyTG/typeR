library(fDMA)


### Name: plot.tvp
### Title: Plots Selected Outcomes from 'tvp' Object.
### Aliases: plot.tvp

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D 
##D tvp <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99)
##D 
##D # graphics.off()
##D plot(tvp)
## End(Not run)



