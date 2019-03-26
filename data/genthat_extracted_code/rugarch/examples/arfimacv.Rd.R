library(rugarch)


### Name: arfimacv
### Title: ARFIMAX time series cross validation
### Aliases: arfimacv

### ** Examples

## Not run: 
##D require(xts)
##D require(parallel)
##D data(sp500ret)
##D spx = as.xts(sp500ret)
##D nn = nrow(spx)
##D nx = nn-round(0.9*nn,0)
##D if(nx##D 
##D h = (nx/50)-1
##D indexin = lapply(1:h, function(j){ tail(seq(1,(nn-nx)+j*50, by=1),250) })
##D indexout = lapply(indexin, function(x){ (tail(x,1)+1):(tail(x,1)+50) })
##D cl = makePSOCKcluster(5)
##D mod = arfimacv(spx, indexin, indexout, ar.max = 2, ma.max = 2, 
##D criterion = c("rmse","mae","berkowitzp")[1],
##D berkowitz.significance = 0.05, arfima = FALSE, include.mean = NULL, 
##D distribution.model = "norm", cluster = cl, external.regressors = NULL, 
##D solver = "solnp")
##D stopCluster(cl)
## End(Not run)



