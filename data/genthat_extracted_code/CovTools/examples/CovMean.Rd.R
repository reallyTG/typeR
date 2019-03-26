library(CovTools)


### Name: CovMean
### Title: Estimate Mean Covariance Matrix
### Aliases: CovMean

### ** Examples

## Not run: 
##D ## generate 100 sample covariances of size (5-by-5).
##D samples = samplecovs(100,5)
##D 
##D ## Compute mean of first 50 sample covariances from data under Normal(0,Identity).
##D mLERM = CovMean(samples[,,1:50],method="LERM")
##D mAIRM = CovMean(samples[,,1:50],method="AIRM")
## End(Not run)




