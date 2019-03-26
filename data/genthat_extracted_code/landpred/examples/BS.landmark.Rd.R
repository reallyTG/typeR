library(landpred)


### Name: BS.landmark
### Title: Estimates the Brier score.
### Aliases: BS.landmark
### Keywords: prediction accuracy survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8
Prob.Null(t0=t0,tau=tau,data=data_example_landpred)

out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

BS.landmark(t0=t0,tau=tau, data = out$data)




