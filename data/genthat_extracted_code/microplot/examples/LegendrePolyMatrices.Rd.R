library(microplot)


### Name: LegendrePolyMatrices
### Title: Legendre Orthogonal Polynomials for various values of alpha and
###   beta. The dataset is used in the demo("LegendrePolynomials").
### Aliases: LegendrePolyMatrices
### Keywords: datasets

### ** Examples

## Not run: 
##D ## dontrun is to avoid requiring the user to install the polynom and orthopolynom packages
##D 
##D ## These matrices are used in the demo showing both latex and msWord tables
##D ##     demo("LegendrePolynomials"       , package="microplot", ask=TRUE)
##D 
##D ## Legendre Polynomials
##D if (require(orthopolynom)) {
##D LP.score <- function(alpha, beta, m = 4, B = 100) {
##D   x <- seq(1/B, 1 - 1/B, length = B)
##D   u <- stats::pbeta(x, alpha, beta)
##D   poly <-  slegendre.polynomials(m, normalized=TRUE)
##D   data.frame(x=x, T=sapply(poly[-1], predict, u))
##D }
##D 
##D alphas <- c(.25, .5, 1)
##D betas <- c(.25, .5, 1, 2, 10)
##D 
##D 
##D ## generate LegendrePolyMatrices
##D LegendrePolyMatrices <- matrix(list(), nrow=length(alphas), ncol=length(betas),
##D                                dimnames=list(alphas=alphas, betas=betas))
##D for (alpha in seq(along=alphas))
##D    for (beta in seq(along=betas))
##D      LegendrePolyMatrices[[alpha, beta]] <- LP.score(alphas[alpha], betas[beta])
##D 
##D save(LegendrePolyMatrices, file="LegendrePolyMatrices.rda")
##D 
##D detach("package:orthopolynom", unload=TRUE)
##D detach("package:polynom", unload=TRUE)
##D } else data(LegendrePolyMatrices)
## End(Not run)



