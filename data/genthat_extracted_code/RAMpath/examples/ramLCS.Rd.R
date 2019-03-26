library(RAMpath)


### Name: ramLCS
### Title: Univariate latent change score model
### Aliases: ramLCS

### ** Examples

data(ex3)
test.lcs<-ramLCS(ex3, 7:12)
summary(test.lcs$lavaan, fit=TRUE)

bridge<-ramPathBridge(test.lcs$ram, allbridge=FALSE, indirect=FALSE)
plot(bridge, 'lcs')



