library(sSDR)


### Name: gOLS.comp.d
### Title: Groupwise OLS (gOLS) BIC criterion to estimate dimensions with
###   eigen-decomposition
### Aliases: gOLS.comp.d

### ** Examples

data <- gen.data(n=1000, binary=FALSE) # generate data
dim(data$X) # covariate matrix of 1000 observations and 15 predictors
dim(data$y) # univariate response
groups <- c(5, 10) # two predictor groups and their numbers of predictors
dim_gOLS<-gOLS.comp.d(data$X,data$y,groups)
names(dim_gOLS)



