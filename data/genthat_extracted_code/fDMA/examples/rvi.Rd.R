library(fDMA)


### Name: rvi
### Title: Extracts Relative Variable Importances from 'fDMA' Model.
### Aliases: rvi

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10)
##D r <- rvi(m1)
## End(Not run)



