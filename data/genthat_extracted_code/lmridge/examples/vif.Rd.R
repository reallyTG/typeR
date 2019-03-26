library(lmridge)


### Name: vif.lmridge
### Title: Variance Inflation Fator for Linear Ridge Regression
### Aliases: vif vif.lmridge
### Keywords: ridge variance inflation factor ridge VIF

### ** Examples

data(Hald)
mod <- lmridge(y~., data = as.data.frame(Hald), scaling = "sc", K = seq(0,1,.2) )
vif(mod)



