library(lmridge)


### Name: vcov.lmridge
### Title: Variance-Covariance Matrix for Fitted Ridge Model
### Aliases: vcov.lmridge vcov
### Keywords: ridge variance covariance matrix

### ** Examples

data(Hald)
mod<- lmridge(y~., data=as.data.frame(Hald), scaling="sc", K=seq(0,1,.2) )

vcov.lmridge(mod)
vcov(mod)



