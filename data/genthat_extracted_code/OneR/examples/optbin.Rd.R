library(OneR)


### Name: optbin
### Title: Optimal Binning function
### Aliases: optbin optbin.formula optbin.data.frame
### Keywords: binning discretization discretize

### ** Examples

data <- iris # without optimal binning
model <- OneR(data, verbose = TRUE)
summary(model)

data_opt <- optbin(iris) # with optimal binning
model_opt <- OneR(data_opt, verbose = TRUE)
summary(model_opt)

## The same with the formula interface:
data_opt <- optbin(Species ~., data = iris)
model_opt <- OneR(data_opt, verbose = TRUE)
summary(model_opt)




