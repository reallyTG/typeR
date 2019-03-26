library(not)


### Name: aic.penalty
### Title: Akaike Information Criterion penalty
### Aliases: aic.penalty

### ** Examples

#*** a simple example how to use the AIC penalty
x <- rnorm(300) + c(rep(1,50),rep(0,250))
w <- not(x)
w.cpt <- features(w, penalty="aic")
w.cpt$cpt[[1]]



