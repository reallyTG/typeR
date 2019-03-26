library(probsvm)


### Name: probsvm
### Title: Main function that provides models for multiclass conditional
###   probability estimation and label prediction
### Aliases: probsvm

### ** Examples

# iris data #

data(iris)

iris.x=iris[c(1:20,51:70,101:120),-5]  
 
iris.y=iris[c(1:20,51:70,101:120),5]

iris.test=iris[c(21:50,71:100,121:150),-5]  
 
a = probsvm(iris.x,iris.y,type="ovo",
	Inum=10,fold=2,lambdas=2^seq(-10,10,by=3))
predict(a, iris.test)



