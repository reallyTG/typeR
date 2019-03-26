library(bliss)


### Name: Bliss_Simulated_Annealing
### Title: Bliss_Simulated_Annealing
### Aliases: Bliss_Simulated_Annealing

### ** Examples

## No test: 
data(data1)
data(param1)
param1$grids<-data1$grids
# result of res_bliss1<-fit_Bliss(data=data1,param=param1)
data(res_bliss1)
beta_sample <- compute_beta_sample(posterior_sample=res_bliss1$posterior_sample,
                                   param=param1,Q=1)
param_test<-list(grid=param1$grids[[1]],iter=1e3,K=2)
test<-Bliss_Simulated_Annealing(beta_sample[[1]],
                 res_bliss1$posterior_sample$param$normalization_values[[1]],
                 param=param_test)
ylim <- range(range(test$Bliss_estimate),range(test$Smooth_estimate))
plot(param_test$grid,test$Bliss_estimate,type="l",ylim=ylim)
lines(param_test$grid,test$Smooth_estimate,lty=2)
## End(No test)



