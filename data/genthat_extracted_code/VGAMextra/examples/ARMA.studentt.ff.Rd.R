library(VGAMextra)


### Name: ARMA.studentt.ff
### Title: VGLTSMs Family Functions: Generalized autoregressive moving
###   average model with Student-t errors
### Aliases: ARMA.studentt.ff

### ** Examples

### Estimate the parameters of the errors distribution for an
## AR(1) model. Sample size = 50

set.seed(20180218)
nn <- 250
y  <- numeric(nn)
ncp   <- 0           # Non--centrality parameter
nu    <- 3.5         # Degrees of freedom.
theta <- 0.45        # AR coefficient
res <- numeric(250)  # Vector of residuals.

y[1] <- rt(1, df = nu, ncp = ncp)
for (ii in 2:nn) {
  res[ii] <- rt(1, df = nu, ncp = ncp)
  y[ii] <- theta * y[ii - 1] + res[ii]
}
# Remove warm up values.
y <- y[-c(1:200)]
res <- res[-c(1:200)]

### Fitting an ARMA(1, 0) with Student-t errors.
AR.stut.er.fit <- vglm(y ~ 1, ARMA.studentt.ff(order = c(1, 0)),
                       data = data.frame(y = y), trace = TRUE)

summary(AR.stut.er.fit)
Coef(AR.stut.er.fit)

## No test: 
plot(ts(y), col = "red", lty = 1, ylim = c(-6, 6), main = "Plot of series Y with Student-t errors")
lines(ts(fitted.values(AR.stut.er.fit)), col = "blue", lty = 2)
abline( h = 0, lty = 2)
## End(No test)






