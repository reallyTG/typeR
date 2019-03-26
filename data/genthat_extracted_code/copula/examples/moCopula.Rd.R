library(copula)


### Name: moCopula
### Title: The Marshall-Olkin Copula
### Aliases: moCopula
### Keywords: multivariate

### ** Examples

alpha <- c(0.2, 0.7)
MO <- moCopula(alpha)
tau(MO) # 0.18
lambda(MO)
stopifnot(all.equal(lambda(MO),
                    c(lower = 0, upper = 0.2)))
wireframe2  (MO, FUN = pCopula) # if you look carefully, you can see the kink
contourplot2(MO, FUN = pCopula)
set.seed(271)
plot(rCopula(1000, MO))



