library(mombf)


### Name: eprod
### Title: Expectation of a product of powers of Normal or T random
###   variables
### Aliases: eprod
### Keywords: models distrib

### ** Examples

#Check easy independence case
m <- c(0,3); S <- matrix(c(2,0,0,1),ncol=2)

eprod(m, S, power=2)

(m[1]^2+S[1][1])*(m[2]^2+S[2][2])



