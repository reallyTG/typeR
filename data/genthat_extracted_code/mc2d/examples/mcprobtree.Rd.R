library(mc2d)


### Name: mcprobtree
### Title: Creates a Stochastic mcnode Object using a Probability Tree
### Aliases: mcprobtree
### Keywords: methods

### ** Examples

## A mixture of normal (prob=0.75), uniform (prob=0.20) and constant (prob=0.05)
conc1 <- mcstoc(rnorm, type="VU", mean=10, sd=2)
conc2 <- mcstoc(runif, type="VU", min=-6, max=-5)
conc3 <- mcdata(0, type="VU")

## Randomly in the cells 
whichdist <- mcstoc(rempiricalD, type="VU", values=1:3, prob= c(.75, .20, .05)) 
mcprobtree(whichdist, list("1"=conc1, "2"=conc2, "3"=conc3), type="VU")
## Which is equivalent to 
mcprobtree(c(.75, .20, .05), list("1"=conc1, "2"=conc2, "3"=conc3), type="VU")
## Not that there is no control on the exact number of occurences.

## Randomly by colums (Uncertainty) 
whichdist <- mcstoc(rempiricalD, type="U", values=1:3, prob= c(.75, .20, .05)) 
mcprobtree(whichdist, list("1"=conc1, "2"=conc2, "3"=conc3), type="VU")

## Randomly by line (Variability) 
whichdist <- mcstoc(rempiricalD, type="V", values=1:3, prob= c(.75, .20, .05)) 
mcprobtree(whichdist, list("1"=conc1, "2"=conc2, "3"=conc3), type="VU")

## The elements of mcvalues may be of various (but compatible) type
conc1 <- mcstoc(rnorm, type="V", mean=10, sd=2)
conc2 <- mcstoc(runif, type="U", min=-6, max=-5)
conc3 <- mcdata(0, type="0")
whichdist <- mcstoc(rempiricalD, type="VU", values=1:3, prob= c(.75, .20, .05))
mcprobtree(whichdist, list("1"=conc1, "2"=conc2, "3"=conc3), type="VU")





