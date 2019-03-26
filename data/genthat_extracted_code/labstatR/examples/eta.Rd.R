library(labstatR)


### Name: eta
### Title: Calcola l'indice di dipendenza in media
### Aliases: eta
### Keywords: multivariate

### ** Examples

x <- c(rep(1,10),rep(0,23), rep(2,15))
y <- c(rnorm(10,mean=7),rnorm(23,mean=19),rnorm(15,mean=17))
eta(x,y)
y <- c(rnorm(10,mean=8),rnorm(23,mean=7),rnorm(15,mean=6.5))
eta(x,y)



