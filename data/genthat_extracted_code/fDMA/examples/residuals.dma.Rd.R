library(fDMA)


### Name: residuals.dma
### Title: Extracts Residuals from 'dma' Model.
### Aliases: residuals.dma residuals

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.99,initvar=1,model="dma")
##D r <- residuals(object=m1)
## End(Not run)



