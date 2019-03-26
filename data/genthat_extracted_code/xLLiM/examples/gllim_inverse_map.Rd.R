library(xLLiM)


### Name: gllim_inverse_map
### Title: Inverse Mapping from gllim or bllim parameters
### Aliases: gllim_inverse_map

### ** Examples

data(data.xllim)

## Setting 5 components in the model
K = 5

## the model can be initialized by running an EM algorithm for Gaussian Mixtures (EMGM)
r = emgm(data.xllim, init=K); 
## and then the gllim model is estimated
responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns
mod = gllim(responses,covariates,in_K=K,in_r=r);

## Charge testing data
data(data.xllim.test)
## Prediction on a test dataset
pred = gllim_inverse_map(data.xllim.test,mod)
## Predicted responses
print(pred$x_exp)

## Can also be applied on an object returned by bllim function 
## Learn the BLLiM model
# mod = bllim(responses,covariates,in_K=K,in_r=r);
## Prediction on a test dataset
# pred = gllim_inverse_map(data.xllim.test,mod)
## Predicted responses
# print(pred$x_exp)



