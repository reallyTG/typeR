library(NHMSAR)


### Name: prediction.MSAR
### Title: One step ahead predict for (non) homogeneous MSAR models
### Aliases: prediction.MSAR
### Keywords: MSAR prediction forecast cross-validation

### ** Examples

## Not run
#data(meteo.data)
#data = array(meteo.data$temperature,c(31,41,1)) 
#T = dim(data)[1]
#N.samples = dim(data)[2]
#d = dim(data)[3]
#M = 2
#theta.init = init.theta.MSAR(data,M=M,order=2,label="HH")
#res.hh.2 = fit.MSAR(data,theta.init,verbose=TRUE,MaxIter=200)
#y.p.2 = prediction.MSAR(data,res.hh.2$theta,ex=1:N.samples)
#RMSE.2 = mean((data-y.p.2$y.p)^2)



