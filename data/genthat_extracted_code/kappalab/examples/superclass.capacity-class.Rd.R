library(kappalab)


### Name: superclass.capacity-class
### Title: Class "superclass.capacity"
### Aliases: superclass.capacity-class
### Keywords: classes

### ** Examples

## three capacities
mu1 <- uniform.capacity(5)
mu2 <- capacity(c(0,0,0:13))
a <- Mobius(mu2)

## compute indices to summarize them
summary(mu1)
summary(mu2)
summary(a)



