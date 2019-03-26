library(fDMA)


### Name: plot.grid.tvp
### Title: Plots Selected Outcomes from 'grid.tvp' Function.
### Aliases: plot.grid.tvp

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D 
##D grl <- c(0.99,0.98,0.97,0.96,0.95)
##D g <- grid.tvp(y=ld.wti,x=ld.drivers,V=1,grid.lambda=grl)
##D 
##D plot(g)
## End(Not run)



