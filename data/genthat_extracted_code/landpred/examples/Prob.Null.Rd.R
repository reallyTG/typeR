library(landpred)


### Name: Prob.Null
### Title: Estimates P(TL <t0+tau | TL > t0).
### Aliases: Prob.Null
### Keywords: prediction survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8
Prob.Null(t0=t0,tau=tau,data=data_example_landpred)

out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

newdata = matrix(c(1,1,3,0,4,1,10,1,11,0), ncol = 2, byrow=TRUE)
out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred,newdata=newdata)
out$Prob
out$newdata




