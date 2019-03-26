library(mixAK)


### Name: NMixEM
### Title: EM algorithm for a homoscedastic normal mixture
### Aliases: NMixEM print.NMixEM
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Estimates for 3-component mixture in  Anderson's iris data
##D ## ==========================================================
##D data(iris, package="datasets")
##D summary(iris)
##D 
##D VARS <- names(iris)[1:4]
##D fit <- NMixEM(iris[, VARS], K = 3)
##D print(fit)
##D 
##D apply(subset(iris, Species == "versicolor")[, VARS], 2, mean)
##D apply(subset(iris, Species == "setosa")[, VARS], 2, mean)
##D apply(subset(iris, Species == "virginica")[, VARS], 2, mean)
##D 
##D ## Estimates of 6-component mixture in Galaxy data
##D ## ==================================================
##D data(Galaxy, package="mixAK")
##D summary(Galaxy)
##D 
##D fit2 <- NMixEM(Galaxy, K = 6)
##D y <- seq(5, 40, length=300)
##D fy <- dMVNmixture(y, weight=fit2$weight, mean=fit2$mean,
##D                      Sigma=rep(fit2$Sigma, fit2$K))
##D hist(Galaxy, prob=TRUE, breaks=seq(5, 40, by=0.5),
##D      main="", xlab="Velocity (km/sec)", col="sandybrown")
##D lines(y, fy, col="darkblue", lwd=2)
## End(Not run)



