library(lori)


### Name: plot.lori
### Title: plot 2D displays of the row-column interactions
### Aliases: plot.lori

### ** Examples

X = matrix(rnorm(rep(0, 15)), 5)
Y <- matrix(rpois(length(c(X)), exp(c(X))), 5)
res_lori <- lori(Y, cov=cbind(c(X),c(X)), lambda1=1, lambda2=1)
p <- plot(res_lori)



