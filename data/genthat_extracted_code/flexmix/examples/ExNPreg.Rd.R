library(flexmix)


### Name: ExNPreg
### Title: Artificial Example for Normal, Poisson and Binomial Regression
### Aliases: ExNPreg NPreg
### Keywords: datasets

### ** Examples

data("NPreg", package = "flexmix")
plot(yn ~ x, data = NPreg, col = class)
plot(yp ~ x, data = NPreg, col = class)
plot(yb ~ x, data = NPreg, col = class)



