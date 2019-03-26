library(Renext)


### Name: Maxlo
### Title: 'maxlo' distribution
### Aliases: Maxlo dmaxlo pmaxlo qmaxlo rmaxlo
### Keywords: distribution

### ** Examples

xs <- rmaxlo(500, shape = 2.2, scale = 1000)
hist(xs, main = "'maxlo' distribution"); rug(xs)

xs <- rmaxlo(500, shape = 4, scale = 1000)
hist(xs, main = "'maxlo' distribution"); rug(xs)

x <- seq(from = -10, to = 1010, by = 2)
plot(x = x, y = dmaxlo(x, shape = 4, scale = 1000),
     type = "l", ylab = "dens",
     col = "orangered", main = "dmaxlo and dgpd")
abline(h = 0)
lines(x = x, y = dgpd(x, shape = -1/4, scale = 250),
     type = "l",
     col = "SpringGreen3", lty = "dashed")






