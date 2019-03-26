library(imputeR)


### Name: impute
### Title: General Imputation Framework in R
### Aliases: impute

### ** Examples

data(parkinson)
# introduce 10% random missing values into the parkinson data
missdata <- SimIm(parkinson, 0.1)
# impute the missing values by LASSO
## No test: 
impdata <- impute(missdata, lmFun = "lassoR")
# calculate the normalised RMSE for the imputation
Rmse(impdata$imp, missdata, parkinson, norm = TRUE)
## End(No test)



