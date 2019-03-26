library(msda)


### Name: cv.msda
### Title: Cross-validation for msda
### Aliases: cv.msda
### Keywords: models classification

### ** Examples

data(GDS1615)
x<-GDS1615$x
y<-GDS1615$y
obj.cv<-cv.msda(x=x,y=y,nfolds=5,lambda.opt="max")
lambda.min<-obj.cv$lambda.min
id.min<-which(obj.cv$lambda==lambda.min)
pred<-predict(obj.cv$msda.fit,x)[,id.min]



