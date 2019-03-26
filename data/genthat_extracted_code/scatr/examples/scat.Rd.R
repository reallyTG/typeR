library(scatr)


### Name: scat
### Title: Scatterplot
### Aliases: scat

### ** Examples

set.seed(1337)

X <- rnorm(100)
Y <- 0.5*X + rnorm(100)
dat <- data.frame(X = X, Y = Y)

scat(dat, x = 'X', y = 'Y', line = 'linear', se = TRUE, marg = 'dens')




