library(reglogit)


### Name: reglogit
### Title: Gibbs sampling for regularized logistic regression
### Aliases: reglogit regmlogit
### Keywords: methods classif

### ** Examples

## load in the pima indian data
data(pima)
X <- as.matrix(pima[,-9])
y <- as.numeric(pima[,9])

## pre-normalize to match the comparison in the paper
one <- rep(1, nrow(X))
normx <- sqrt(drop(one %*% (X^2)))
X <- scale(X, FALSE, normx)

## compare to the GLM fit
fit.logit <- glm(y~X, family=binomial(link="logit"))
bstart <- fit.logit$coef

## do the Gibbs sampling
T <- 300 ## set low for CRAN checks; increase to >= 1000 for better results
out6 <- reglogit(T, y, X, nu=6, nup=NULL, bstart=bstart, normalize=FALSE)

## plot the posterior distribution of the coefficients
burnin <- (1:(T/10)) 
boxplot(out6$beta[-burnin,], main="nu=6, kappa=1", ylab="posterior",
        xlab="coefficients", bty="n", names=c("mu", paste("b", 1:8, sep="")))
abline(h=0, lty=2)

## add in GLM fit and MAP with legend
points(bstart, col=2, pch=17)
points(out6$map$beta, pch=19, col=3)
legend("topright", c("MLE", "MAP"), col=2:3, pch=c(17,19))

## simple prediction
p6 <- predict(out6, XX=X)
## hit rate
mean(p6$c == y)

##
## for a polychotomous example, with prediction, 
## see ? predict.regmlogit
##

## Not run: 
##D ## now with kappa=10
##D out10 <- reglogit(T, y, X, kappa=10, nu=6, nup=NULL, bstart=bstart, 
##D                             normalize=FALSE)
##D 
##D ## plot the posterior distribution of the coefficients
##D par(mfrow=c(1,2))
##D boxplot(out6$beta[-burnin,], main="nu=6, kappa=1",  ylab="posterior",
##D         xlab="coefficients", bty="n",  names=c("mu", paste("b", 1:8, sep="")))
##D abline(h=0, lty=2) 
##D points(bstart, col=2, pch=17)
##D points(out6$map$beta, pch=19, col=3)
##D legend("topright", c("MLE", "MAP"), col=2:3, pch=c(17,19))
##D boxplot(out10$beta[-burnin,], main="nu=6, kappa=10",  ylab="posterior",
##D         xlab="coefficients", bty="n",  names=c("mu", paste("b", 1:8, sep="")))
##D abline(h=0, lty=2)
##D ## add in GLM fit and MAP with legend
##D points(bstart, col=2, pch=17)
##D points(out10$map$beta, pch=19, col=3)
##D legend("topright", c("MLE", "MAP"), col=2:3, pch=c(17,19))
## End(Not run)

##
## now some binomial data
##

## Not run: 
##D ## synthetic data generation
##D library(boot)
##D N <- rep(20, 100)
##D beta <- c(2, -3, 2, -4, 0, 0, 0, 0, 0)
##D X <- matrix(runif(length(N)*length(beta)), ncol=length(beta))
##D eta <- drop(1 + X %*% beta)
##D p <- inv.logit(eta)
##D y <- rbinom(length(N), N, p)
##D 
##D ## run the Gibbs sampler for the logit -- uses the fast Binomial
##D ## version; for a comparison, try flatten=FALSE
##D out <- reglogit(T, y, X, N)
##D 
##D ## plot the posterior distribution of the coefficients
##D boxplot(out$beta[-burnin,], main="binomial data",  ylab="posterior", 
##D        xlab="coefficients", bty="n",
##D        names=c("mu", paste("b", 1:ncol(X), sep="")))
##D abline(h=0, lty=2)
##D 
##D ## add in GLM fit, the MAP fit, the truth, and a legend
##D fit.logit <- glm(y/N~X, family=binomial(link="logit"), weights=N)
##D points(fit.logit$coef, col=2, pch=17)
##D points(c(1, beta), col=4, pch=16)
##D points(out$map$beta, pch=19, col=3)
##D legend("topright", c("MLE", "MAP", "truth"), col=2:4, pch=c(17,19,16))
##D 
##D ## also try specifying a larger kappa value to pin down the MAP
## End(Not run)



