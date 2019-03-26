library(fDMA)


### Name: grid.DMA
### Title: Computes 'fDMA' Function for Multiple Values of 'alpha' and
###   'lambda'.
### Aliases: grid.DMA

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D gra <- c(0.99,0.98,0.97)
##D grl <- c(0.99,0.95)
##D g1 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=10)
## End(Not run)
## Don't show: 
gra <- c(0.99,0.98,0.97)
grl <- c(0.99,0.95)
g <- grid.DMA(y=ld.wti[1:20,1],x=ld.drivers[1:20,1:4],grid.alpha=gra,grid.lambda=grl,initvar=10)
## End(Don't show)
# extract model with alpha=0.97 and lambda=0.95
model <- g$models[[3]][[2]]

# models with various multiple lambdas
## Not run: 
##D gra <- c(0.99,0.98,0.97)
##D grl <- list(c(0.99,0.95,0.90),c(0.99,0.98,0.97,0.96,0.95))
##D g2 <- grid.DMA(y=ld.wti,x=ld.drivers,grid.alpha=gra,grid.lambda=grl,initvar=10)
## End(Not run)



