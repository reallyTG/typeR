library(evmix)


### Name: kfun
### Title: Various subsidiary kernel function, conversion of bandwidths and
###   evaluating certain kernel integrals.
### Aliases: kfun klambda kbw check.kinputs check.kernel check.kbw ka0 ka1
###   ka2 check.kinputs check.kernel check.kbw klambda kbw ka0 ka1 ka2

### ** Examples

xx = seq(-2, 2, 0.01)
plot(xx, kdgaussian(xx), type = "l", col = "black",ylim = c(0, 1.2))
lines(xx, kduniform(xx), col = "grey")
lines(xx, kdtriangular(xx), col = "blue")
lines(xx, kdepanechnikov(xx), col = "darkgreen")
lines(xx, kdbiweight(xx), col = "red")
lines(xx, kdtriweight(xx), col = "purple")
lines(xx, kdtricube(xx), col = "orange")
lines(xx, kdparzen(xx), col = "salmon")
lines(xx, kdcosine(xx), col = "cyan")
lines(xx, kdoptcosine(xx), col = "goldenrod")
legend("topright", c("Gaussian", "uniform", "triangular", "Epanechnikov",
"biweight", "triweight", "tricube", "Parzen", "cosine", "optcosine"), lty = 1,
col = c("black", "grey", "blue", "darkgreen", "red", "purple",
  "salmon", "orange", "cyan", "goldenrod"))




