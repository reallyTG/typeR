library(kappalab)


### Name: superclass.set.func-class
### Title: Class "superclass.set.func"
### Aliases: superclass.set.func-class
### Keywords: classes

### ** Examples

## three set functions
mu1 <- card.set.func(-2:4)
mu2 <- set.func(c(-2,-2,-2:11/11))
mu3 <- Mobius.set.func(c(-7:6,6,6),4,4)

## print mu1
show(mu1)
## the same
mu1
## the others
mu2
mu3

## round mu2
rnd(mu2,2)

## compute indices to summarize them
summary(mu1)
summary(mu2)
summary(mu3)



