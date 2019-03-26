library(wbs)


### Name: mbic.penalty
### Title: Modified Bayes Information Criterion penalty term
### Aliases: mbic.penalty

### ** Examples

x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- wbs(x)
w.cpt <- changepoints(w,penalty="mbic.penalty")
w.cpt$cpt.ic



