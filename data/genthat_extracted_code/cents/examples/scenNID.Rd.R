library(cents)


### Name: scenNID
### Title: mle estimation of singly-left-censored data using AS 138
### Aliases: scenNID
### Keywords: htest models

### ** Examples

n <- 50
cy <- (-1)
z <- rnorm(n)
ind <- z > cy
y <- z[ind]
scenNID(y, n, cy)



