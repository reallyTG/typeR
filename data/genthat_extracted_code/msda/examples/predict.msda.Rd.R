library(msda)


### Name: predict.msda
### Title: make predictions from a "msda" object.
### Aliases: predict.msda
### Keywords: models classification

### ** Examples

data(GDS1615)
x<-GDS1615$x
y<-GDS1615$y
obj <- msda(x = x, y = y)
pred<-predict(obj,x)



