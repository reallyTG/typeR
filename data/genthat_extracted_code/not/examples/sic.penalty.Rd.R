library(not)


### Name: sic.penalty
### Title: Schwarz Information Criterion penalty
### Aliases: sic.penalty

### ** Examples

#*** a simple example how to use the AIC penalty
x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- not(x)
w.cpt <- features(w, penalty="sic")
w.cpt$cpt[[1]]



