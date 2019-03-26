library(refund)


### Name: pcre
### Title: pffr-constructor for functional principal component-based
###   functional random intercepts.
### Aliases: pcre

### ** Examples

## Not run: 
##D residualfunction <- function(t){
##D #generate quintic polynomial error functions
##D     drop(poly(t, 5)%*%rnorm(5, sd=sqrt(2:6)))
##D }
##D # generate data Y(t) = mu(t) + E(t) + white noise
##D set.seed(1122)
##D n <- 50
##D T <- 30
##D t <- seq(0,1, l=T)
##D # E(t): smooth residual functions
##D E <- t(replicate(n, residualfunction(t)))
##D int <- matrix(scale(3*dnorm(t, m=.5, sd=.5) - dbeta(t, 5, 2)), byrow=T, n, T)
##D Y <- int + E + matrix(.2*rnorm(n*T), n, T)
##D data <- data.frame(Y=I(Y))
##D # fit model under independence assumption:
##D summary(m0 <- pffr(Y ~ 1, yind=t, data=data))
##D # get first 5 eigenfunctions of residual covariance
##D # (i.e. first 5 functional PCs of empirical residual process)
##D Ehat <- resid(m0)
##D fpcE <- fpca.sc(Ehat, npc=5)
##D efunctions <- fpcE$efunctions
##D evalues <- fpcE$evalues
##D data$id <- factor(1:nrow(data))
##D # refit model with fpc-based residuals
##D m1 <- pffr(Y ~ 1 + pcre(id=id, efunctions=efunctions, evalues=evalues, yind=t), yind=t, data=data)
##D t1 <- predict(m1, type="terms")
##D summary(m1)
##D #compare squared errors
##D mean((int-fitted(m0))^2)
##D mean((int-t1[[1]])^2)
##D mean((E-t1[[2]])^2)
##D # compare fitted & true smooth residuals and fitted intercept functions:
##D layout(t(matrix(1:4,2,2)))
##D matplot(t(E), lty=1, type="l", ylim=range(E, t1[[2]]))
##D matplot(t(t1[[2]]), lty=1, type="l", ylim=range(E, t1[[2]]))
##D plot(m1, select=1, main="m1", ylim=range(Y))
##D lines(t, int[1,], col=rgb(1,0,0,.5))
##D plot(m0, select=1, main="m0", ylim=range(Y))
##D lines(t, int[1,], col=rgb(1,0,0,.5))
## End(Not run)



