library(HelpersMG)


### Name: dSnbinom
### Title: Density for the sum of random variable with negative binomial
###   distributions.
### Aliases: dSnbinom

### ** Examples

## Not run: 
##D alpha <- c(1, 2, 5, 1, 2)
##D p <- c(0.1, 0.12, 0.13, 0.14, 0.14)
##D # Test with lower iterations: 2 or 50 rather than 10 [default]; precision is very good still with 10
##D dSnbinom(20, size=alpha, prob=p, infinite=50)
##D dSnbinom(20, size=alpha, prob=p, infinite=10)
##D dSnbinom(20, size=alpha, prob=p, infinite=2)
##D # However it is not always the case; It depends on the parametrization (see Furman 2007)
##D dSnbinom(20, size=2, mu=c(0.01, 0.02, 0.03), infinite=1000)
##D dSnbinom(20, size=2, mu=c(0.01, 0.02, 0.03), infinite=100)
##D dSnbinom(20, size=2, mu=c(0.01, 0.02, 0.03), infinite=50)
##D dSnbinom(20, size=2, mu=c(0.01, 0.02, 0.03), infinite=10)
##D dSnbinom(20, size=2, mu=c(0.01, 0.02, 0.03), infinite=2)
##D # Test with a single distribution
##D dSnbinom(20, size=1, mu=20)
##D # when only one distribution is available, it is the same as dnbinom()
##D dnbinom(20, size=1, mu=20)
##D # If a parameter is supplied as only one value, it is supposed to be constant
##D dSnbinom(20, size=1, mu=c(14, 15, 10))
##D # The function is vectorized:
##D plot(0:200, dSnbinom(0:200, size=alpha, prob=p), bty="n", type="h", xlab="x", ylab="Density")
##D # Comparison with simulated distribution using rep replicates
##D alpha <- c(2.1, 2.05, 2)
##D mu <- c(10, 30, 20)
##D rep <- 100000
##D distEmpirique <- rSnbinom(rep, size=alpha, mu=mu)
##D tabledistEmpirique <- rep(0, 301)
##D names(tabledistEmpirique) <- as.character(0:300)
##D tabledistEmpirique[names(table(distEmpirique))] <- table(distEmpirique)/rep
##D 
##D plot(0:300, dSnbinom(0:300, size=alpha, mu=mu, infinite=1000), type="h", bty="n", 
##D    xlab="x", ylab="Density", ylim=c(0,0.02))
##D plot_add(0:300, tabledistEmpirique, type="l", col="red")
##D legend(x=200, y=0.02, legend=c("Empirical", "Theoretical"), 
##D    text.col=c("red", "black"), bty="n")
##D 
##D # Example with the approximation mu=mean(mu)
##D plot(0:300, dSnbinom(0:300, size=alpha, mu=mu, infinite=0), type="h", bty="n", 
##D    xlab="x", ylab="Density", ylim=c(0,0.02))
##D plot_add(0:300, tabledistEmpirique, type="l", col="red")
##D legend(x=200, y=0.02, legend=c("Empirical", "Theoretical"), 
##D    text.col=c("red", "black"), bty="n")
##D    
##D # example to fit the distribution
##D data <- rnbinom(1000, size=1, mu=10)
##D hist(data)
##D ag <- rep(1:100, 10)
##D r <- aggregate(data, by=list(ag), FUN=sum)
##D hist(r[,2])
##D 
##D parx <- c(size=1, mu=10)
##D 
##D dSnbinomx <- function(x, par) {
##D   -sum(dSnbinom(x=x[,2], mu=rep(par["mu"], 10), size=par["size"], log=TRUE, 
##D                 infinite = 1000))
##D }
##D 
##D fit_mu_size <- optim(par = parx, fn=dSnbinomx, x=r, method="BFGS", control=c(trace=TRUE))
##D fit_mu_size$par
## End(Not run)



