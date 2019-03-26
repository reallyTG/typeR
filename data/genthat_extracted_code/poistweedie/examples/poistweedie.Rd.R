library(poistweedie)


### Name: poistweedie
### Title: Poisson-Tweedie (Some discrete exponential dispersion models)
### Aliases: poistweedie poisson nbinomiale
### Keywords: models

### ** Examples

## poistweedie(x, n, p, mu, lambda, theta0, lower.tail = TRUE, 
##             log.p = FALSE, fonction = "PROBABILITE")
x <- 0:200
p <- 1.5
mu <-10     
lambda <- 10
theta0<--10
d1<-poistweedie(x, n, p, mu, lambda, theta0, lower.tail = TRUE,
log.p = FALSE, fonction = "PROBABILITE")



