library(bmrm)


### Name: lpSVM
### Title: Linearly Programmed SVM
### Aliases: lpSVM svmLP predict.svmLP svmMulticlassLP predict.svmMLP

### ** Examples

  x <- cbind(100,data.matrix(iris[1:4]))
  y <- iris$Species
  w <- svmMulticlassLP(x,y)
  table(predict(w,x),y)

  w <- svmLP(x,y=="setosa")
  table(predict(w,x),y)



