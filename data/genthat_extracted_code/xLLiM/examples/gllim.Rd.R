library(xLLiM)


### Name: gllim
### Title: EM Algorithm for Gaussian Locally Linear Mapping
### Aliases: gllim

### ** Examples

data(data.xllim)

## Setting 5 components in the model
K =5

## the model can be initialized by running an EM algorithm for Gaussian Mixtures (EMGM)
r = emgm(data.xllim, init=K); 
## and then the gllim model is estimated
responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns
mod = gllim(responses,covariates,in_K=K,in_r=r);

## if initialization is not specified, the model is automatically initialized by EMGM
## mod = gllim(responses,covariates,in_K=K)

## Adding 1 latent factor 
## mod = gllim(responses,covariates,in_K=K,in_r=r,Lw=1)

## Some constraints on the covariance structure of \eqn{X} can be added
## mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="i")) 
# Isotropic covariances
# (same variance among covariates but different in each component)

## mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="d")) 
# Heteroskedastic covariances
# (variances are different among covariates and in each component)

## mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="")) 
# Unconstrained full matrix

## mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="*")) 
# Full matrix but equal between components



