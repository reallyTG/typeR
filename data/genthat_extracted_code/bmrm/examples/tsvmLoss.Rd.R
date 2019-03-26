library(bmrm)


### Name: tsvmLoss
### Title: Non convex loss function for transductive SVM
### Aliases: tsvmLoss

### ** Examples

x <- cbind(intercept=100,data.matrix(iris[1:2]))
y <- iris$Species=="virginica"
y[iris$Species=="setosa"] <- NA
w <- nrbm(tsvmLoss(x,y),convexRisk=FALSE)
table(predict(w,x),iris$Species)



