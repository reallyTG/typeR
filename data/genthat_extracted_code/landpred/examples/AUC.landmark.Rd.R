library(landpred)


### Name: AUC.landmark
### Title: Estimates the area under the ROC curve (AUC).
### Aliases: AUC.landmark
### Keywords: prediction accuracy survival

### ** Examples

data(data_example_landpred)
t0=2
tau = 8
Prob.Null(t0=t0,tau=tau,data=data_example_landpred)

out = Prob.Null(t0=t0,tau=tau,data=data_example_landpred)
out$Prob
out$data

AUC.landmark(t0=t0,tau=tau, data = out$data)




