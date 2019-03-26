library(wbs)


### Name: ssic.penalty
### Title: Strengthened Schwarz Information Criterion penalty term
### Aliases: ssic.penalty

### ** Examples

x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- wbs(x)
w.cpt <- changepoints(w,penalty="ssic.penalty")
w.cpt$cpt.ic



