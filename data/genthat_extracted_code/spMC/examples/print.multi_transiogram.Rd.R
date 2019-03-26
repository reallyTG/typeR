library(spMC)


### Name: print.multi_transiogram
### Title: Printing Theoretical Multidimensional Transiograms
### Aliases: print.multi_transiogram
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)

# Estimate the parameters of a 
# multidimensional MC model
RTm <- multi_tpfit(ACM$MAT3, ACM[, 1:3])

# Generate the matrix of 
# multidimensional lags
lags <- expand.grid(X=-1:1, Y=-1:1, Z=-1:1)
lags <- as.matrix(lags)

# Compute transition probabilities 
# from the multidimensional MC model
TrPr <- predict(RTm, lags)

# Print results
print(TrPr)
## End(No test)


