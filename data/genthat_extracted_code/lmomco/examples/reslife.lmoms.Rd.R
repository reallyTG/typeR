library(lmomco)


### Name: reslife.lmoms
### Title: L-moments of Residual Life
### Aliases: reslife.lmoms
### Keywords: lifetime/reliability analysis L-moment (residual life)
###   L-moment (theoretical)

### ** Examples

A <- vec2par(c(230, 2649, 3), type="gov") # Set lower bounds = 230 hours
F <- nonexceeds(f01=TRUE)
plot(F, rmlmomco(F,A), type="l", ylim=c(0,3000), # mean residual life [black]
     xlab="NONEXCEEDANCE PROBABILITY",
     ylab="LIFE, RESIDUAL LIFE (RL), RL_L-SCALE, RL_L-skew (rescaled)")
L1 <- L2 <- T3 <- vector(mode="numeric", length=length(F))
for(i in 1:length(F)) {
  lmr <- reslife.lmoms(F[i], A, nmom=3)
  L1[i] <- lmr$lambdas[1]; L2[i] <- lmr$lambdas[2]; T3[i] <- lmr$ratios[3]
}
lines(c(0,1), c(1500,1500),  lty=2) # Origin line (to highlight T3 crossing "zero")
lines(F, L1,          col=2, lwd=3) # Mean life (not residual, that is M(u)) [red]
lines(F, L2,          col=3, lwd=3) # L-scale of residual life [green]
lines(F, 5E3*T3+1500, col=4, lwd=3) # L-skew of residual life (re-scaled) [blue]
## Not run: 
##D # Nair et al. (2013, p. 203), test shows L2(u=0.37) = 771.2815
##D A <- vec2par(c(230, 2649, 0.3), type="gpa"); F <- 0.37
##D "afunc" <- function(p) { return((1-p)*rmlmomco(p,A)) }
##D L2u1 <- (1-F)^(-2)*integrate(afunc,F,1)$value
##D L2u2 <- reslife.lmoms(F,A)$lambdas[2]
## End(Not run)



