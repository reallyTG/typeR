library(StatMatch)


### Name: fact2dummy
### Title: Transforms a categorical variable in a set of dummy variables
### Aliases: fact2dummy
### Keywords: multivariate cluster

### ** Examples


x <- runif(5)
y <- factor(c(1,2,1,2,2))
z <- ordered(c(1,2,3,2,2))
xyz <- data.frame(x,y,z)
fact2dummy(xyz)

fact2dummy(xyz, all=FALSE)


#example with iris data frame
str(iris)
ir.mat <- fact2dummy(iris)




