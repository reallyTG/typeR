library(lmridge)


### Name: infocr.lmridge
### Title: Model Selection Criteria for Ridge Regression
### Aliases: infocr infocr.lmridge
### Keywords: model information selection criteria AIC BIC

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, .2, 0.001))
infocr(mod)

## Vector of AIC values
infocr(mod)[,1]

## vector of BIC values
infocr(mod)[,2]



