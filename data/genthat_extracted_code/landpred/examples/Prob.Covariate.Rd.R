library(landpred)


### Name: Prob.Covariate
### Title: Estimates P(TL <t0+tau | TL > t0, Z), i.e. given discrete
###   covariate.
### Aliases: Prob.Covariate
### Keywords: prediction survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8
Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred)

out = Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

newdata = matrix(c(1,1,1, 3,0,1, 4,1,1, 10,1,0, 11,0,1), ncol = 3, byrow=TRUE)
out = Prob.Covariate(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
out$Prob
out$newdata




