library(NHMSAR)


### Name: forecast.prob.MSAR
### Title: Forecast probabilities for (non) homogeneous MSAR models
### Aliases: forecast.prob.MSAR
### Keywords: Forecasting MSAR

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
#FP = forecast.prob.MSAR(data,res.hh.2$theta)
#plot(data[,1,],typ="l")
#lines(FP$Yhat[,1],col="red")
#alpha = .1
#IC.emp = matrix(0,2,T)
#for (k in 1:length(data[,1,])) {
#	tmp = cumsum(FP$prob[,k,1])/sum(FP$prob[,k,1])
#	IC.emp[1,k] = FP$yrange[max(which(tmp<alpha/2))]
#	IC.emp[2,k] = FP$yrange[max(which(tmp<(1-alpha/2)))]
#}
#lines(IC.emp[1,],lty=2,col="red")
#lines(IC.emp[2,],lty=2,col="red")



