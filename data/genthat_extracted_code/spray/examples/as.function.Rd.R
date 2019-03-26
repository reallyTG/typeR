library(spray)


### Name: as.function.spray
### Title: Coerce a spray object to a function
### Aliases: as.function.spray
### Keywords: symbolmath

### ** Examples


S1 <- spray(matrix(sample(-2:2,replace=TRUE,21),ncol=3),rnorm(7),addrepeats=TRUE)
S2 <- spray(matrix(sample(-2:2,replace=TRUE,15),ncol=3),rnorm(5),addrepeats=TRUE)

f1 <- as.function(S1)
f2 <- as.function(S2)

f3 <- as.function(S1*S2)


x <- 4:6

f1(x)*f2(x)-f3(x)  # should be zero



# coercion is vectorized:

f1(matrix(1:33,ncol=3))


  



