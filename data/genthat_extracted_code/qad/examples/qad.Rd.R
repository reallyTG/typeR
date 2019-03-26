library(qad)


### Name: qad
### Title: Measure of (asymmetric) dependence
### Aliases: qad qad.data.frame qad.numeric

### ** Examples

#Example 1 (independence)

n <- 1000
x <- runif(n,0,1)
y <- runif(n,0,1)
sample <- data.frame(x,y)
qad(sample)

###

#Example 2 (mutual complete dependence)

n <- 1000
x <- runif(n,0,1)
y <- x^2
sample <- data.frame(x,y)
qad(sample)

#Example 3 (complete dependence)

n <- 1000
x <- runif(n,-10,10)
y <- sin(x)
sample <- data.frame(x,y)
qad(sample)



