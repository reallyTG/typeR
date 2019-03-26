library(landpred)


### Name: landpred-package
### Title: Landmark Prediction of a Survival Outcome
### Aliases: landpred-package landpred
### Keywords: survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8

####Landmark prediction with no covariate or short term information
Prob.Null(t0=t0,tau=tau,data=data_example_landpred)
out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

newdata = matrix(c(1,1,3,0,4,1,10,1,11,0), ncol = 2, byrow=TRUE)
out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
out$Prob
out$newdata

#Landmark prediction with covariate information only
Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred)
out = Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

newdata = matrix(c(1,1,1, 3,0,1, 4,1,1, 10,1,0, 11,0,1), ncol = 3, byrow=TRUE)
out = Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
out$Prob
out$newdata

#Landmark prediction with covariate information and short term event information
#note: computationally intensive commands below
#Prob.Covariate.ShortEvent(t0=t0,tau=tau,data=data_example_landpred)
#out = Prob.Covariate.ShortEvent(t0=t0,tau=tau,data=data_example_landpred)
#out$data
#data.plot = out$data
#plot(data.plot$XS[data.plot$Z ==1], data.plot$Probability[data.plot$Z ==1], 
#pch = 20, xlim = c(0,t0))
#points(data.plot$XS[data.plot$Z ==0], data.plot$Probability[data.plot$Z ==0], 
#pch = 20, col = 2)

newdata = matrix(c(1,1,0.5,1,0,
3,0,1,1,1,
4,1,1.5,1,0,
10,1,5,1,0,
11,0,11,0,1), ncol = 5, byrow=TRUE)
#note: computationally intensive command below
#out=Prob.Covariate.ShortEvent(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
#out$newdata




