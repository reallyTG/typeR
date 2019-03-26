library(fDMA)


### Name: print.grid.dma
### Title: Prints 'grid.dma' Object.
### Aliases: print.grid.dma

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D gra <- c(0.99,0.98,0.97)
##D grl <- c(0.99,0.95)
##D g1 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=1)
##D g2 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=1,model="dms")
## End(Not run)
## Don't show: 
gra <- c(0.99,0.98,0.97)
grl <- c(0.99,0.95)
s <- ld.drivers[1:20,1:4]
g1 <- grid.DMA(y=ld.wti[1:20,1],x=s,grid.alpha=gra,grid.lambda=grl,initvar=1)
g2 <- grid.DMA(y=ld.wti[1:20,1],x=s,grid.alpha=gra,grid.lambda=grl,initvar=1,model="dms")
## End(Don't show)
print(g1)
print(g2)



