library(copula)


### Name: enacopula
### Title: Estimation Procedures for (Nested) Archimedean Copulas
### Aliases: enacopula
### Keywords: models

### ** Examples

tau <- 0.25
(theta <- copGumbel@iTau(tau)) # 4/3
d <- 12
(cop <- onacopulaL("Gumbel", list(theta,1:d)))

set.seed(1)
n <- 100
U <- rnacopula(n, cop)

meths <- eval(formals(enacopula)$method)
## Don't show: 
meths <- meths[meths != "smle"]
## End(Don't show)
fun <- function(meth, u, cop, theta) {
	run.time <- system.time(val <- enacopula(u, cop=cop, method=meth))
	list(value=val, error=val-theta, utime.ms=1000*run.time[[1]])
}
t(res <- sapply(meths, fun, u=U, cop=cop, theta=theta))



