library(naivereg)


### Name: naive.gmm
### Title: Estimete the parameters with gmm after IV selecting
### Aliases: naive.gmm

### ** Examples

#gmm after IV selecting
data("naivedata")
x=naivedata[,1]
y=naivedata[,2]
z=naivedata[,3:102]
naive.gmm(y~x+x^2,cbind(x,x^2),z)
naive.gmm(y~exp(x)+x,cbind(x,exp(x)),z)



