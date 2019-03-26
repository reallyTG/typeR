library(ape)


### Name: rTraitCont
### Title: Continuous Character Simulation
### Aliases: rTraitCont
### Keywords: datagen

### ** Examples

data(bird.orders)
rTraitCont(bird.orders) # BM with sigma = 0.1
### OU model with two optima:
tr <- reorder(bird.orders, "postorder")
plot(tr)
edgelabels()
theta <- rep(0, Nedge(tr))
theta[c(1:4, 15:16, 23:24)] <- 2
## sensitive to 'alpha' and 'sigma':
rTraitCont(tr, "OU", theta = theta, alpha=.1, sigma=.01)
### an imaginary model with stasis 0.5 time unit after a node, then
### BM evolution with sigma = 0.1:
foo <- function(x, l) {
    if (l <= 0.5) return(x)
    x + (l - 0.5)*rnorm(1, 0, 0.1)
}
tr <- rcoal(20, br = runif)
rTraitCont(tr, foo, ancestor = TRUE)
### a cumulative Poisson process:
bar <- function(x, l) x + rpois(1, l)
(x <- rTraitCont(tr, bar, ancestor = TRUE))
plot(tr, show.tip.label = FALSE)
Y <- x[1:20]
A <- x[-(1:20)]
nodelabels(A)
tiplabels(Y)



