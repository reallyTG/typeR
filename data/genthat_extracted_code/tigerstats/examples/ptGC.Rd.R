library(tigerstats)


### Name: ptGC
### Title: Graphical Calculator for t-Curve Probabilities
### Aliases: ptGC

### ** Examples

#This gives P(-2 < t < 2) for a t-random variable with 1 degree of freedom:
ptGC(c(-2,2),region="between",df=1)

#This gives P(t < -1) for a t-random variable with 5 degrees of freedom:
ptGC(-1,region="below",df=5)

#This gives P( t < -2 OR t >2), for a t-random variable with 5 degrees of freedom:
ptGC(c(-2,2),region="outside",df=5)



