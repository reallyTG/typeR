library(copula)


### Name: emde
### Title: Minimum Distance Estimators for (Nested) Archimedean Copulas
### Aliases: emde
### Keywords: models

### ** Examples

tau <- 0.25
(theta <- copGumbel@iTau(tau)) # 4/3
d <- 20
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

set.seed(1)
n <- 200
U <- rnacopula(n, cop)

(meths <- eval(formals(emde)$method)) # "mde.chisq.CvM", ...
fun <- function(meth, u, cop, theta){
	run.time <- system.time(val <- emde(u, cop=cop, method=meth)$minimum)
	list(value=val, error=val-theta, utime.ms=1000*run.time[[1]])
}
(res <- sapply(meths, fun, u=U, cop=cop, theta=theta))



