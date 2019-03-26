library(mplot)


### Name: bodyfat
### Title: Body fat data set
### Aliases: bodyfat
### Keywords: datasets

### ** Examples

data(bodyfat)
full.mod = lm(Bodyfat~.,data=subset(bodyfat,select=-Id))



