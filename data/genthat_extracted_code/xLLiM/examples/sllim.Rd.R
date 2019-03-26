library(xLLiM)


### Name: sllim
### Title: EM Algorithm for Student Locally Linear Mapping
### Aliases: sllim

### ** Examples

data(data.xllim)
responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns

## Setting 5 components in the model
K = 5

## the model can be initialized by running an EM algorithm for Gaussian Mixtures (EMGM)
r = emgm(rbind(responses, covariates), init=K); 
## and then the sllim model is estimated
mod = sllim(responses,covariates,in_K=K,in_r=r);

## if initialization is not specified, the model is automatically initialized by EMGM
## mod = sllim(responses,covariates,in_K=K)

## Adding 1 latent factor 
## mod = sllim(responses,covariates,in_K=K,in_r=r,Lw=1)

## Some constraints on the covariance structure of \eqn{X} can be added
## mod = sllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="i")) 
# Isotropic covariance matrices
# (same variance among covariates but different in each component)

## mod = sllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="d")) 
# Heteroskedastic covariance matrices
# (variances are different among covariates and in each component)

## mod = sllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="")) 
# Unconstrained full covariance matrices

## mod = sllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="*")) 
# Full covariance matrices but equal for all components



