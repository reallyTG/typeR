library(riskRegression)


### Name: getSplitMethod
### Title: Input for data splitting algorithms
### Aliases: getSplitMethod

### ** Examples

# 3-fold crossvalidation
getSplitMethod("cv3",B=4,N=37)

# bootstrap with replacement
getSplitMethod("loob",B=4,N=37)

# bootstrap without replacement
getSplitMethod("loob",B=4,N=37,M=20)




