library(transport)


### Name: semidiscrete1
### Title: Compute Semidiscrete Optimal Transport for Euclidean Distance
###   Cost
### Aliases: semidiscrete1
### Keywords: optimal semidiscrete, transport

### ** Examples

## Not run: 
##D # the following function rotates a matrix m clockwise, so
##D # that image(rococlock(m)) has the same orientation as print(m):
##D roclock <- function(m) t(m)[, nrow(m):1]
##D 
##D set.seed(30)
##D n <- 20
##D nu <- matrix(c(runif(2*n), rgamma(n,3,1)), n, 3)
##D pixelbdry <- seq(0,1,length=33)
##D image(pixelbdry, pixelbdry, roclock(random32a$mass), asp=1, col = grey(seq(0,1,length.out=32)))
##D points(nu[,1], nu[,2], pch=16, cex=sqrt(nu[,3])/2, col=2)
##D 
##D res <- semidiscrete1(random32a$mass, nu)
##D plot_apollonius(nu[,1:2], res$weights, show_weights = FALSE, add = TRUE)
##D points(nu[,1], nu[,2], pch=16, cex=sqrt(nu[,3])/2, col=2)
## End(Not run)




