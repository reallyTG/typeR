library(HelpersMG)


### Name: rSnbinom
### Title: Random generation for the sum of random variable with negative
###   binomial distributions.
### Aliases: rSnbinom

### ** Examples

## Not run: 
##D alpha <- c(2.1, 2.05, 2)
##D mu <- c(10, 30, 20)
##D rep <- 100000
##D distEmpirique <- rSnbinom(n=rep, size=alpha, mu=mu)
##D tabledistEmpirique <- rep(0, 301)
##D names(tabledistEmpirique) <- as.character(0:300)
##D tabledistEmpirique[names(table(distEmpirique))] <- table(distEmpirique)/rep
##D 
##D plot(0:300, dSnbinom(0:300, size=alpha, mu=mu, infinite=1000), type="h", bty="n", 
##D    xlab="x", ylab="Density", ylim=c(0,0.02))
##D plot_add(0:300, tabledistEmpirique, type="l", col="red")
##D legend(x=200, y=0.02, legend=c("Empirical", "Theoretical"), 
##D    text.col=c("red", "black"), bty="n")
## End(Not run)



