library(ddsPLS)


### Name: predict.mddsPLS
### Title: The predict function of a mdd-sPLS model
### Aliases: predict.mddsPLS

### ** Examples

data("liver.toxicity")
X <- scale(liver.toxicity$gene)
Y <- scale(liver.toxicity$clinic)
mod_0 <- mddsPLS(X,Y)
Y_test <- predict(mod_0,X)



