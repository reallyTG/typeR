library(fDMA)


### Name: print.grid.tvp
### Title: Prints 'grid.tvp' Object.
### Aliases: print.grid.tvp

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D grl <- c(0.99,0.98,0.97,0.96,0.95)
##D g <- grid.tvp(y=ld.wti,x=ld.drivers,V=1,grid.lambda=grl)
##D 
##D print(g)
## End(Not run)



