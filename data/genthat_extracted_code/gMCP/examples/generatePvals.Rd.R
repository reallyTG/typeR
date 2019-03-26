library(gMCP)


### Name: generatePvals
### Title: generatePvals
### Aliases: generatePvals
### Keywords: htest

### ** Examples


## Define some graph as matrix
g <- matrix(c(0,0,1,0, 0,0,0,1, 0,1,0,0, 1,0,0,0), nrow = 4, byrow=TRUE)
## Choose weights
w <- c(.5,.5,0,0)
## Some correlation (upper and lower first diagonal 1/2)
c <- diag(4)
c[1:2,3:4] <- NA
c[3:4,1:2] <- NA
c[1,2] <- 1/2
c[2,1] <- 1/2
c[3,4] <- 1/2
c[4,3] <- 1/2
## p-values as Section 3 of Bretz et al. (2011),
p <- c(0.0121,0.0337,0.0084,0.0160)

## Boundaries for correlated test statistics at alpha level .05:
generatePvals(g,w,c,p)

g <- Entangled2Maurer2012()
generatePvals(g=g, cr=diag(5), p=rep(0.1,5))




