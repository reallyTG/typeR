library(copula)


### Name: emle
### Title: Maximum Likelihood Estimators for (Nested) Archimedean Copulas
### Aliases: emle .emle
### Keywords: models

### ** Examples

tau <- 0.25
(theta <- copGumbel@iTau(tau)) # 4/3
d <-  20
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

set.seed(1)
n <- 200
U <- rnacopula(n,cop)

## Estimation
system.time(efm <- emle(U, cop))
summary(efm) # using bblme's 'mle2' method

## Profile likelihood plot [using S4 methods from bbmle/stats4] :
pfm <- profile(efm)
ci  <- confint(pfm, level=0.95)
ci
stopifnot(ci[1] <= theta, theta <= ci[2])
plot(pfm)               # |z| against theta, |z| = sqrt(deviance)
plot(pfm, absVal=FALSE, #  z  against theta
     show.points=TRUE) # showing how it's interpolated
## and show the true theta:
abline(v=theta, col="lightgray", lwd=2, lty=2)
axis(1, pos = 0, at=theta, label=quote(theta[0]))

## Plot of the log-likelihood, MLE  and  conf.int.:
logL <- function(x) -efm@minuslogl(x)
       # == -sum(copGumbel@dacopula(U, theta=x, log=TRUE))
logL. <- Vectorize(logL)
I <- c(cop@copula@iTau(0.1), cop@copula@iTau(0.4))
curve(logL., from=I[1], to=I[2], xlab=quote(theta),
      ylab="log-likelihood",
      main="log-likelihood for Gumbel")
abline(v = c(theta, efm@coef), col="magenta", lwd=2, lty=2)
axis(1, at=c(theta, efm@coef), padj = c(-0.5, -0.8), hadj = -0.2,
     col.axis="magenta", label= expression(theta[0], hat(theta)[n]))
abline(v=ci, col="gray30", lwd=2, lty=3)
text(ci[2], extendrange(par("usr")[3:4], f= -.04)[1],
     "95% conf. int.", col="gray30", adj = -0.1)



