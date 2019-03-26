library(ridge)


### Name: linearRidge
### Title: Linear ridge regression.
### Aliases: linearRidge coef.ridgeLinear plot.ridgeLinear
###   predict.ridgeLinear print.ridgeLinear summary.ridgeLinear
###   print.summary.ridgeLinear

### ** Examples

data(GenCont)
mod <- linearRidge(Phenotypes ~ ., data = as.data.frame(GenCont))
summary(mod)



