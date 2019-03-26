library(lme4)


### Name: GHrule
### Title: Univariate Gauss-Hermite quadrature rule
### Aliases: GHrule

### ** Examples

(r5 <- GHrule(5, asMatrix=FALSE))
## second, fourth, sixth, eighth and tenth central moments of the
## standard Gaussian density
with(r5, sapply(seq(2, 10, 2), function(p) sum(w * z^p)))



