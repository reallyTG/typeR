library(xLLiM)


### Name: bllim
### Title: EM Algorithm for Block diagonal Gaussian Locally Linear Mapping
### Aliases: bllim

### ** Examples

data(data.xllim)

## Setting 5 components in the model
K = 5

## the model can be initialized by running an EM algorithm for Gaussian Mixtures (EMGM)
r = emgm(data.xllim, init=K); 
## and then the gllim model is estimated
responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns

## if initialization is not specified, the model is automatically initialized by EMGM
# mod = bllim(responses,covariates,in_K=K)

## Prediction can be performed using prediction function gllim_inverse_map
# pred = gllim_inverse_map(covariates,mod)$x_exp



