library(bliss)


### Name: BIC_model_choice
### Title: BIC_model_choice
### Aliases: BIC_model_choice

### ** Examples

## No test: 
param_sim <- list(Q=1,n=100,p=c(50),grids_lim=list(c(0,1)))
data      <- sim(param_sim,verbose=TRUE)
iter = 1e2
Ks <- 1:5

res_BIC <- BIC_model_choice(Ks,iter,data)
plot(res_BIC,xlab="K",ylab="BIC")
## End(No test)



