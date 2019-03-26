library(partialOR)


### Name: reportOR
### Title: REPORTING THE RESULTS
### Aliases: reportOR

### ** Examples

## generate data
dd <- simData(50,2,1.5,123)
## fit the models
fit <- fitOR(dd)
## report the results
reportOR(fit,dd,0.95)



