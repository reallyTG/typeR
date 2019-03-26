library(lmridge)


### Name: residuals.lmridge
### Title: Ridge Regression Residuals
### Aliases: residuals.lmridge residuals
### Keywords: ridge residuals

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 1, 0.2))
residuals(mod)



