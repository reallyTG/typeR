library(gcdnet)


### Name: predict.gcdnet
### Title: make predictions from a "gcdnet" object.
### Aliases: predict.gcdnet predict.hsvmpath predict.sqsvmpath
###   predict.logitpath predict.lspath predict.erpath
### Keywords: models regression

### ** Examples

data(FHT)
m1 = gcdnet(x=FHT$x,y=FHT$y)
print(predict(m1,type="class",newx=FHT$x[2:5,]))



