library(imputeR)


### Name: plotIm
### Title: Plot function for imputation
### Aliases: plotIm

### ** Examples

data(parkinson)
# introduce 10% random missing values into the parkinson data
missdata <- SimIm(parkinson, 0.1)

# impute the missing values by LASSO
## No test: 
impdata <- impute(missdata, lmFun = "lassoR")

# calculate the normalised RMSE for the imputation
Rmse(impdata$imp, missdata, parkinson, norm = T)

# Plot imputation performance
plotIm(impdata$imp, missdata, parkinson)
## End(No test)



