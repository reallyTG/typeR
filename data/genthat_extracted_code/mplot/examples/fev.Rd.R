library(mplot)


### Name: fev
### Title: Forced Expiratory Volume
### Aliases: fev
### Keywords: datasets

### ** Examples

data(fev)
full.mod = lm(fev~.,data=fev)
step(full.mod)



