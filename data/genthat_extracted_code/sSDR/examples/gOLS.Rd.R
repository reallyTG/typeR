library(sSDR)


### Name: gOLS
### Title: Groupwise OLS (gOLS)
### Aliases: gOLS

### ** Examples

data <- gen.data(n=1000, binary=FALSE) # generate data
dim(data$X) # covariate matrix of 1000 observations and 15 predictors
dim(data$y) # univariate response
groups <- c(5, 10) # two predictor groups and their numbers of predictors
dims <- c(1,1) # dimension of each predictor group
est_gOLS <- gOLS(data$X,data$y,groups,dims)
names(est_gOLS)



