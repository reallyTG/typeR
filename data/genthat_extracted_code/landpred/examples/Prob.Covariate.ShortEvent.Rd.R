library(landpred)


### Name: Prob.Covariate.ShortEvent
### Title: Estimates P(TL <t0+tau | TL > t0, Z, min(TS, t0), I(TS<=t0)),
###   i.e. given discrete covariate and TS information.
### Aliases: Prob.Covariate.ShortEvent
### Keywords: prediction survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8
#note: computationally intensive command below
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
#out = Prob.Covariate.ShortEvent(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
#out$newdata




