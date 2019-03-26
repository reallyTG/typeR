library(RAMpath)


### Name: ramShowModel
### Title: Show the model using Lavvan model syntax
### Aliases: ramShowModel

### ** Examples

data(ex3)
gcm.l<-ramLCM(ex3, 1:6, model='linear', ram.out=TRUE)
## Add correlated errors
ramShowModel(gcm.l)



