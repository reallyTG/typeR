library(logcondiscr)


### Name: kInflatedLogConDiscr
### Title: Compute a mixture of a point mass at 0 and a log-concave
###   probability mass function from i.i.d. data
### Aliases: kInflatedLogConDiscr
### Keywords: distribtion htest nonparametric

### ** Examples


## -----------------------------------------------
## generate zero-inflated negative binomial sample
## -----------------------------------------------
set.seed(2011)
n <- 100
theta <- 0.05
r <- 6
p <- 0.3
x <- rnbinom(n, r, p)

## inflate at 0
x <- ifelse(runif(n) <= theta, 0, x)

## estimate log-concave MLE
fit1 <- logConDiscrMLE(x, w = NA, psi_o = NA, prec = 1e-05, output = TRUE)

## estimate zero-inflated log-concave MLE
fit2 <- kInflatedLogConDiscr(x, k = 0)

## plot the results
par(mfrow = c(1, 1), las = 1)
plot(fit1$x, exp(fit1$psi), type = "b", col = 2, xlim = range(x), xlab = "x", 
    ylim = c(0, max(exp(fit1$psi), fit2$f)), ylab = "PMF", 
    main = "Estimate MLE from a zero-inflated negative-binomial", pch = 19)
lines(fit2$z, fit2$f, type = "b", col = 4, pch = 15)

## add the true PMF we sampled from
z <- fit2$z
f.true <- theta * c(1, rep(0, length(z) - 1)) + (1 - theta) * dnbinom(z, r, p)
lines(z, f.true, col = 6, type = "b", pch = 17)

legend("topright", c("log-concave MLE", "zero-inflated log-concave MLE", 
    "true PMF"), col = c(2, 4, 6), lty = c(1, 1, 1), pch = c(19, 15, 17), 
    bty = "n")
    
## Not run: 
##D ## -----------------------------------------------
##D ## generate seven-inflated negative binomial sample
##D ## -----------------------------------------------
##D theta <- 0.05
##D r <- 4
##D p <- 0.3
##D n <- 10000
##D x <- rnbinom(n, r, p)
##D x <- ifelse(runif(n) <= theta, 7, x)
##D x <- c(x, rep(7, 10))
##D 
##D ## compute different estimates
##D zero.mle <- kInflatedLogConDiscr(x, k = 7)
##D mle <- logConDiscrMLE(x, output = FALSE)
##D f.mle <- exp(mle$psiSupp)
##D z<-	zero.mle$z
##D f1 <- theta * c(rep(0, 7 - min(x)), 1, rep(0, max(x) - 7))
##D f2 <- (1 - theta) * dnbinom(z, r, p)
##D f.true <- f1 + f2
##D true <- dnbinom(z, r, p)
##D f.fit <- zero.mle$f
##D xx <- sort(unique(x))
##D emp <- rep(0, length(z))
##D emp[xx - min(x) + 1] <- as.vector(table(x) / n)
##D 
##D ## plot results
##D plot(z, f.true, type = "l", ylim = c(0, max(emp)), xlab = "x", 
##D     ylab = "PMF", main = "Illustration k-inflated estimator")
##D points(z, true, type = "l", lty = 2)
##D points(z, f.fit, type = "l", col = "red")
##D points(z, zero.mle$logconc.pmf, type = "l", col = "red", lty = 2)
##D points(min(x):max(x), f.mle, type = "l", col = "green")
##D points(z, emp, type = "l", col = "purple")
##D points(z, emp, col = "purple")
##D legend("topright", inset = 0.05, c("true", "true less seven", "seven-inflated", 
##D     "recovered", "logconc", "empirical"), lty=c(1, 2, 1, 2, 1, 1), col = c("black", 
##D     "black", "red", "red", "green", "purple"))
##D 
##D ## zoom in near mode
##D subs <- 4:12
##D plot(z[subs], f.true[subs], type = "l", ylim = c(0, max(emp)), xlab = "x", 
##D     ylab = "PMF", main = "Illustration k-inflated estimator")
##D points(z[subs], true[subs], type = "l", lty = 2)
##D points(z[subs], f.fit[subs], type = "l", col = "red")
##D points(z[subs], zero.mle$logconc.pmf[subs], type = "l", col = "red", lty = 2)
##D points((min(x):max(x))[subs], f.mle[subs], type = "l", col = "green")
##D points(z[subs], emp[subs], type = "l", col = "purple")
##D points(z[subs], emp[subs], col = "purple")
## End(Not run)



