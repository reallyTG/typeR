library(KODAMA)


### Name: core_cpp
### Title: Maximization of Cross-Validateed Accuracy Methods
### Aliases: core_cpp

### ** Examples

# Here, the famous (Fisher's or Anderson's) iris data set was loaded
data(iris)
u=as.matrix(iris[,-5])
s=sample(1:150,150,TRUE)

# The maximization of the accuracy of the vector s is performed
results=core_cpp(u, clbest=s,fpar = 10)


print(as.numeric(results$clbest))




