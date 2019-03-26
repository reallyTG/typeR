library(sSDR)


### Name: gSIR.comp.d
### Title: Groupwise SIR (gSIR) BIC criterion to estimate dimensions with
###   eigen-decomposition (binary response)
### Aliases: gSIR.comp.d

### ** Examples

data <- gen.data(n=1000, binary=TRUE) # generate data
dim(data$X) # covariate matrix of 1000 observations and 15 predictors
length(data$y) # univariate response
groups <- c(5, 10) # two predictor groups and their numbers of predictors
dim_gSIR<-gSIR.comp.d(data$X,data$y,groups)
names(dim_gSIR)



