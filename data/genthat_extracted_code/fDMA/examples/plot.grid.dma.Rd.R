library(fDMA)


### Name: plot.grid.dma
### Title: Plots Selected Outcomes from 'grid.DMA' Function.
### Aliases: plot.grid.dma

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D gra <- c(0.99,0.98,0.97)
##D grl <- c(0.99,0.95)
##D 
##D g1 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=1)
##D g2 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=1,model="dms")
##D 
##D # graphics.off()
##D plot(g1)
##D # graphics.off()
##D plot(g2)
## End(Not run)



