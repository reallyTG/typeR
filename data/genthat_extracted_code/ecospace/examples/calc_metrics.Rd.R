library(ecospace)


### Name: calc_metrics
### Title: Calculate Ecological Disparity (Functional Diversity) Dynamics
###   as Function of Sample Size.
### Aliases: calc_metrics

### ** Examples

# Build ecospace framework and a random 50-species sample using neutral rule:
ecospace <- create_ecospace(nchar=15, char.state=rep(3, 15), char.type=rep("numeric", 15))
sample <- neutral(Sseed=5, Smax=50, ecospace=ecospace)
# Using Smax=10 here for fast example
metrics <- calc_metrics(samples=sample, Smax=10, Model="Neutral", Param="NA")
metrics

# Plot statistical dynamics as function of species richness
op <- par()
par(mfrow=c(2,4), mar=c(4, 4, 1, .3))
attach(metrics)
plot(S, H, type="l", cex=.5)
plot(S, D, type="l", cex=.5)
plot(S, M, type="l", cex=.5)
plot(S, V, type="l", cex=.5)
plot(S, FRic, type="l", cex=.5)
plot(S, FEve, type="l", cex=.5)
plot(S, FDiv, type="l", cex=.5)
plot(S, FDis, type="l", cex=.5)

par(op)

# Argument 'increm' switches between incremental and entire-sample calculation
metrics2 <- calc_metrics(samples=sample, Smax=10, Model="Neutral", Param="NA", increm=FALSE)
metrics2
identical(tail(metrics, 1), metrics2) # These are identical


## Not run: 
##D # Can take a few minutes to run to completion
##D # Calculate for 5 samples
##D nreps <- 1:5
##D samples <- lapply(X=nreps, FUN=neutral, Sseed=5, Smax=50, ecospace)
##D metrics <- lapply(X=nreps, FUN=calc_metrics, samples=samples, Model="Neutral", Param="NA")
##D alarm()
##D str(metrics)
## End(Not run)



