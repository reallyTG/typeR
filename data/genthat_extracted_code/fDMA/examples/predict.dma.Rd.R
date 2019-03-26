library(fDMA)


### Name: predict.dma
### Title: Computes Predictions from 'dma' Model.
### Aliases: predict.dma predict

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.99,initvar=1,model="dma")
##D p1 <- predict(object=m1,newdata=ld.drivers,type="backward")
##D p2 <- predict(object=m1,newdata=ld.drivers[1,],type="forward")
##D p3 <- predict(object=m1,newdata=ld.drivers[1:3,],type="forward")
## End(Not run)



