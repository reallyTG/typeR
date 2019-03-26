library(QRM)


### Name: VaRbound
### Title: Computing lower and upper bounds for the (smallest or largest)
###   VaR
### Aliases: VaRbound
### Keywords: VaR multivariate

### ** Examples

qPar <- function(p, theta) (1-p)^(-1/theta)-1
qmar <- lapply(1:3, function(j) function(p) qPar(p, theta=2.5))
## bounds for the largest VaR
VaRbound(0.99, N=50, qmargins=qmar)
## bounds for the smallest VaR
VaRbound(0.99, N=50, qmargins=qmar, bound="lower")



