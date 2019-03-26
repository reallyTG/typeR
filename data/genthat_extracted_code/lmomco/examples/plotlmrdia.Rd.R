library(lmomco)


### Name: plotlmrdia
### Title: Plot L-moment Ratio Diagram
### Aliases: plotlmrdia
### Keywords: L-moment ratio diagram Graphics

### ** Examples

plotlmrdia(lmrdia()) # simplest of all uses

## Not run: 
##D # A more complex example follows.
##D # For a given mean, L-scale, L-skew, and L-kurtosis, let us use a sample size
##D # of 30 and using 500 simulations, set the L-moments in lmr and fit the Kappa.
##D T3 <- 0.34; T4 <- 0.21; n <- 30; nsim <- 500
##D lmr <- vec2lmom(c(10000,7500,T3,T4)); kap <- parkap(lmr)
##D 
##D # Next, create vectors for storing simulated L-skew (t3) and L-kurtosis (t4)
##D t3 <- t4 <- vector(mode = "numeric")
##D 
##D # Next, perform nsim simulations by randomly drawing from the Kappa distribution
##D # and compute the L-moments in sim.lmr and store the t3 and t4 of each sample.
##D for(i in 1:nsim) {
##D   sim.lmr <- lmoms(rlmomco(n,kap))
##D   t3[i] <- sim.lmr$ratios[3]; t4[i] <- sim.lmr$ratios[4]
##D }
##D 
##D # Next, plot the diagram with a legend at a specified location, and "zoom"
##D # into the diagram by manually setting the axis limits.
##D plotlmrdia(lmrdia(), autolegend=TRUE, xleg=0.1, yleg=.41,
##D         xlim=c(-.1,.5), ylim=c(-.1,.4), nopoints=TRUE, empty=TRUE)
##D 
##D # Follow up by plotting the {t3,t4} values and the mean of these.
##D points(t3,t4)
##D points(mean(t3),mean(t4),pch=16,cex=3)
##D 
##D # Now plot the trajectories of the distributions.
##D plotlmrdia(lmrdia(), add=TRUE)
##D 
##D # Finally, plot crossing dashed lines at true values of L-skew and L-kurtosis.
##D lines(c(T3,T3),c(-1,1),col=8, lty=2)
##D lines(c(-1,1),c(T4,T4),col=8, lty=2) #
## End(Not run)



