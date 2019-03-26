library(npsurv)


### Name: logLikuh
### Title: Computes the Log-likelihood Value of a U-shaped Hazard Function
### Aliases: logLikuh
### Keywords: function

### ** Examples

data(ap)
(h0 = uh(.2, NULL, NULL, NULL, NULL, 15, 1))   # Uniform hazard
plot(h0, ylim=c(0,.3))
logLikuh(h0, ap)

r = Uhaz(ap, deg=2)
r$ll
logLikuh(r$h, ap)
plot(r$h, add=TRUE, col="red3")



