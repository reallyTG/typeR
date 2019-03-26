library(ape)


### Name: rTraitDisc
### Title: Discrete Character Simulation
### Aliases: rTraitDisc
### Keywords: datagen

### ** Examples

data(bird.orders)
### the two followings are the same:
rTraitDisc(bird.orders)
rTraitDisc(bird.orders, model = matrix(c(0, 0.1, 0.1, 0), 2))

### two-state model with irreversibility:
rTraitDisc(bird.orders, model = matrix(c(0, 0, 0.1, 0), 2))

### simple two-state model:
tr <- rcoal(n <- 40, br = runif)
x <- rTraitDisc(tr, ancestor = TRUE)
plot(tr, show.tip.label = FALSE)
nodelabels(pch = 19, col = x[-(1:n)])
tiplabels(pch = 19, col = x[1:n])

### an imaginary model with stasis 0.5 time unit after a node, then
### random evolution:
foo <- function(x, l) {
    if (l < 0.5) return(x)
    sample(2, size = 1)
}
tr <- rcoal(20, br = runif)
x <- rTraitDisc(tr, foo, ancestor = TRUE)
plot(tr, show.tip.label = FALSE)
co <- c("blue", "yellow")
cot <- c("white", "black")
Y <- x[1:20]
A <- x[-(1:20)]
nodelabels(A, bg = co[A], col = cot[A])
tiplabels(Y, bg = co[Y], col = cot[Y])



