library(norm2)


### Name: miInference
### Title: Combine results from analyses after multiple imputation
### Aliases: miInference print.miInference
### Keywords: NA

### ** Examples


## create 25 multiple imputations for the cholesterol data
## using functions from the NORM library
data(cholesterol)
emResult <- emNorm(cholesterol)
set.seed(234)
mcmcResult <- mcmcNorm(emResult, iter=2500, impute.every=100)

## get estimates and standard errors for the mean of Y1
## minus the mean of Y3
est.list <- as.list(NULL)
std.err.list <- as.list( NULL )
for( m in 1:25 ){
   yimp <- mcmcResult$imp.list[[m]]  # one imputed dataset
   diff <- yimp[,"Y1"] - yimp[,"Y3"]
   est.list[[m]] <- mean(diff)
   std.err.list[[m]] <- sqrt( var(diff) / length(diff) ) }

## combine the results by rules of Barnard and Rubin (1999)
## with df.complete = 27, because a paired t-test in a dataset with
## N=28 cases has 27 degrees of freedom
miResult <- miInference(est.list, std.err.list, df.complete=27)
print(miResult)




