library(MXM)


### Name: Check Markov equivalence of two DAGs
### Title: Check Markov equivalence of two DAGs
### Aliases: equivdags
### Keywords: DAGs Markov equivalence

### ** Examples

y <- rdag(1000, 10, 0.3)
tru <- y$G 
x <- y$x
mod <- pc.con(x)

eg <- dag2eg(y$G) ## make it essential graph first 
est <- pc.or(mod)$G

equivdags(est, tru)



