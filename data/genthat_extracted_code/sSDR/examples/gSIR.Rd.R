library(sSDR)


### Name: gSIR
### Title: Groupwise SIR (gSIR) for binary response
### Aliases: gSIR

### ** Examples

data <- gen.data(n=1000, binary=TRUE) # generate data
dim(data$X) # covariate matrix of 1000 observations and 15 predictors
length(data$y) # binary response
groups <- c(5, 10) # two predictor groups and their numbers of predictors
dims <- c(1,1) # dimension of each predictor group
est_gSIR<-gSIR(data$X,data$y,groups,dims)
names(est_gSIR)



