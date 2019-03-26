library(Hmisc)


### Name: rcorrp.cens
### Title: Rank Correlation for Paired Predictors with a Possibly Censored
###   Response, and Integrated Discrimination Index
### Aliases: rcorrp.cens improveProb print.improveProb
### Keywords: survival nonparametric regression

### ** Examples

set.seed(1)
library(survival)

x1 <- rnorm(400)
x2 <- x1 + rnorm(400)
d.time <- rexp(400) + (x1 - min(x1))
cens   <- runif(400,.5,2)
death  <- d.time <= cens
d.time <- pmin(d.time, cens)
rcorrp.cens(x1, x2, Surv(d.time, death))
#rcorrp.cens(x1, x2, y) ## no censoring

set.seed(1)
x1 <- runif(1000)
x2 <- runif(1000)
y  <- sample(0:1, 1000, TRUE)
rcorrp.cens(x1, x2, y)
improveProb(x1, x2, y)



