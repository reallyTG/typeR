library(xLLiM)


### Name: xLLiM-package
### Title: High Dimensional Locally-Linear Mapping
### Aliases: xLLiM-package

### ** Examples

### Not run

## Example of inverse regression with GLLiM model
# data(data.xllim)  
# dim(data.xllim) #  size 52 y 100
# responses = data.xllim[1:2,] # 2 responses in rows and 100 observations in columns
# covariates = data.xllim[3:52,] # 50 covariates in rows and 100 observations in columns

## Set 5 components in the model
# K = 5

## Step 1: initialization of the posterior probabilities (class assignments) 
## via standard EM for a joint Gaussian Mixture Model
# r = emgm(rbind(responses, covariates), init=K); 

## Step 2: estimation of the model
## Default Lw=0 and cstr$Sigma="i"
# mod = gllim(responses,covariates,in_K=K,in_r=r)

## Skip Step 1 and go to Step 2: automatic initialization and estimation of the model
# mod = gllim(responses,covariates,in_K=K)

## Alternative: Add Lw=1 latent factor to the model
# mod = gllim(responses,covariates,in_K=K,in_r=r,Lw=1)

## Different constraints on the large covariance matrices can be added: 
## see details in the documentation of the GLLiM function
## description
# mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="i")) #default
# mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="d"))
# mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma=""))
# mod = gllim(responses,covariates,in_K=K,in_r=r,cstr=list(Sigma="*"))
## End of example of inverse regression with GLLiM model

## Step 3: Prediction on a test dataset
# data(data.xllim.test) size 50 y 20
# pred = gllim_inverse_map(data.xllim.test,mod)
## Predicted responses using the mean of \eqn{p(y | x)}.
# pred$x_exp

## Example of leave-ntest-out (1 fold cross-validation) procedure 
# n = ncol(covariates)
# ntest=10
# id.test = sample(1:n,ntest)
# train.responses = responses[,-id.test]
# train.covariates = covariates[,-id.test]
# test.responses = responses[,id.test]
# test.covariates = covariates[,id.test]

## Learn the model on training data
# mod = gllim(train.responses, train.covariates,in_K=K)

## Predict responses on testing data 
# pred = gllim_inverse_map(test.covariates,mod)$x_exp

## nrmse : normalized root mean square error to measure prediction performance 
## the normalization term is the rmse of the prediction by the mean of training responses
## an nrmse larger than 1 means that the procedure performs worse than prediction by the mean
# norm_term = sqrt(rowMeans(sweep(test.responses,1,rowMeans(train.responses),"-")^2))
## Returns 1 value for each response variable 
# nrmse = sqrt(rowMeans((test.responses-pred)^2))/norm_term 




