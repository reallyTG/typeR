library(RAMpath)


### Name: ramReFit
### Title: Refit a model with additional paths
### Aliases: ramReFit

### ** Examples

data(ex3)
gcm.l<-ramLCM(ex3, 1:6, model='linear', ram.out=TRUE)
## Add correlated errors
ramReFit(gcm.l, add='X1~~X2')



