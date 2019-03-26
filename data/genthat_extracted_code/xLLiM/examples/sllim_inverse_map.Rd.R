library(xLLiM)


### Name: sllim_inverse_map
### Title: Inverse Mapping from sllim parameters
### Aliases: sllim_inverse_map

### ** Examples

data(data.xllim)

## Setting 5 components in the model
K = 5

## the model can be initialized by running an EM algorithm for Gaussian Mixtures (EMGM)
r = emgm(data.xllim, init=K); 
## and then the sllim model is estimated
responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns
mod = sllim(responses,covariates,in_K=K,in_r=r);

# Prediction on a test dataset
data(data.xllim.test)
pred = sllim_inverse_map(data.xllim.test,mod)
## Predicted responses
print(pred$x_exp)




