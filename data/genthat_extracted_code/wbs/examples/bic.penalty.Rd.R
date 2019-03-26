library(wbs)


### Name: bic.penalty
### Title: Bayesian Information Criterion penalty term
### Aliases: bic.penalty

### ** Examples

x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- wbs(x)
w.cpt <- changepoints(w,penalty="bic.penalty")
w.cpt$cpt.ic



