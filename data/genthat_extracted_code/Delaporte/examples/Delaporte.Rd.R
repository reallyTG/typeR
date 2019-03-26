library(Delaporte)


### Name: Delaporte
### Title: The Delaporte Distribution
### Aliases: Delaporte delaporte ddelap pdelap qdelap rdelap MoMdelap
### Keywords: distribution

### ** Examples

## Density and distribution
A <- c(0, seq_len(50))
PMF <- ddelap(A, alpha = 3, beta = 4, lambda = 10)
CDF <- pdelap(A, alpha = 3, beta = 4, lambda = 10)

##Quantile
A <- seq(0,.95, .05)
qdelap(A, alpha = 3, beta = 4, lambda = 10)
A <- c(-1, A, 1, 2)
qdelap(A, alpha = 3, beta = 4, lambda = 10)

## Compare a Poisson, negative binomial, and three Delaporte distributions with the same mean:
P <- rpois(25000, 25)                                  ## Will have the tightest spread
DP1 <- rdelap(10000, alpha = 2, beta = 2, lambda = 21) ## Close to the Poisson
DP2 <- rdelap(10000, alpha = 3, beta = 4, lambda = 13) ## In between
DP3 <- rdelap(10000, alpha = 4, beta = 5, lambda = 5)  ## Close to the Negative Binomial
NB <- rnbinom(10000, size = 5, mu = 25)                ## Will have the widest spread
mean(P);mean(NB);mean(DP1);mean(DP2);mean(DP3)         ## Means should all be near 25
MoMdelap(DP1);MoMdelap(DP2);MoMdelap(DP3)              ## Estimates should be close to originals
## Don't show: 
plot(density(P), col = "black", lwd = 2, main = "Distribution Comparison", xlab = "Value")
lines(density(DP1), col = "blue", lwd = 2)
lines(density(DP2), col = "green3", lwd = 2)
lines(density(DP3), col = "orange3", lwd = 2)
lines(density(NB), col = "red", lwd = 2)
legend(x = "topright", legend = c("Poisson {l=25}", "DP {a=2, b=2, l=21}", "DP {a=3, b=4, l=13}",
  "DP {a=4, b=5, l=5}", "NegBinom {a=5, b=5}"), col=c("black", "blue", "green3","orange3", "red"), lwd = 2)
  
## End(Don't show)



