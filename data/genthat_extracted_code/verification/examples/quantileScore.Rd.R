library(verification)


### Name: quantileScore
### Title: Quantile Score
### Aliases: quantileScore
### Keywords: manip

### ** Examples

data(precip.ensemble)

#Observations are in column 3
obs <- precip.ensemble[,3]

#Forecast values of ensemble are in columns 4 to 54
eps <- precip.ensemble[,4:54]

#Quantile forecasts from ensemble
p <- 0.9
qf <- apply(eps,1,quantile,prob=p,type=8)

#generate equally populated binnng intervals
breaks <- quantile(qf,seq(0,1,length.out=11))

qs <- quantileScore(obs,qf,p,breaks)
## Not run:  qrel.plot(qs) 




