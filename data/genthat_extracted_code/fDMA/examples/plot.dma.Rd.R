library(fDMA)


### Name: plot.dma
### Title: Plots Selected Outcomes from 'fDMA' Function.
### Aliases: plot.dma plot

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.99,initvar=1,model="dma")
##D m2 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.99,initvar=1,model="dms")
##D 
##D # graphics.off()
##D plot(m1)
##D # graphics.off()
##D plot(m2)
## End(Not run)



