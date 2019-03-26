library(diversitree)


### Name: make.quasse
### Title: Quantitative State Speciation and Extinction Model
### Aliases: make.quasse starting.point.quasse
### Keywords: models

### ** Examples

## Example showing simple integration with two different backends,
## plus the splits.
lambda <- function(x) sigmoid.x(x, 0.1, 0.2,  0, 2.5)
mu <- function(x) constant.x(x, 0.03)
char <- make.brownian.with.drift(0, 0.025)

set.seed(1)
phy <- tree.quasse(c(lambda, mu, char), max.taxa=15, x0=0,
                   single.lineage=FALSE, verbose=TRUE)

nodes <- c("nd13", "nd9", "nd5")
split.t <- Inf

pars <- c(.1, .2, 0, 2.5, .03, 0, .01)
pars4 <- unlist(rep(list(pars), 4))

sd <- 1/200
control.C.1 <- list(dt.max=1/200)

## Not run: 
##D control.R.1 <- list(dt.max=1/200, method="fftR")
##D lik.C.1 <- make.quasse(phy, phy$tip.state, sd, sigmoid.x, constant.x, control.C.1)
##D (ll.C.1 <- lik.C.1(pars)) # -62.06409
##D 
##D 
##D 
##D 
##D ## slow...
##D lik.R.1 <- make.quasse(phy, phy$tip.state, sd, sigmoid.x, constant.x, control.R.1)
##D (ll.R.1 <- lik.R.1(pars)) # -62.06409
##D 
##D lik.s.C.1 <- make.quasse.split(phy, phy$tip.state, sd, sigmoid.x, constant.x,
##D                                nodes, split.t, control.C.1)
##D (ll.s.C.1 <- lik.s.C.1(pars4)) # -62.06409
## End(Not run)



