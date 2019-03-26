library(censNID)


### Name: censNID
### Title: mle NID sample with single censor point
### Aliases: censNID
### Keywords: htest models

### ** Examples

#Test data
z <- rep((-2):2, rep(3, 5))
cy <- -1.5
y <- z[z>= cy]
censNID(y, length(z), cy) 

#Test left-censoring
set.seed(32173217)
n <- 100
z <- rnorm(n)
cy <- -1
ind <- z > cy
y <- z[ind]
censNID(y, n, cy)

#Test right-censoring
set.seed(32173217)
n <- 100
z <- rnorm(n)
cy <- 1
ind <- z < cy
y <- z[ind]
censNID(y, n, cy, ctyp="right")





