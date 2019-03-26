library(geoBayes)


### Name: linkfcn
### Title: Calculate the link function for exponential families
### Aliases: linkfcn linkinv

### ** Examples

## Not run: 
##D mu <- seq(0.1, 0.9, 0.1)
##D linkfcn(mu, 7, "binomial")       # robit(7) link function
##D linkfcn(mu, , "binomial.logit")  # logit link function
##D 
##D mu <- seq(-3, 3, 1)
##D linkfcn(mu, 0.5, "gaussian")     # sqrt transformation
##D linkinv(linkfcn(mu, 0.5, "gaussian"), 0.5, "gaussian")
##D curve(linkfcn(x, 0.5, "gaussian"), -3, 3)
## End(Not run)



