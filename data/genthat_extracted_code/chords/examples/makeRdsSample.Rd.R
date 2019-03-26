library(chords)


### Name: makeRdsSample
### Title: Generate a synthetic (simulated) RDS sample.
### Aliases: makeRdsSample

### ** Examples

# Generate data:
true.Nks <- rep(0,100); true.Nks[c(2,100)] <- 1000
theta <- 1e-1
true.log.bks <- rep(-Inf, 100);true.log.bks[c(2,100)] <- theta*log(c(2,100))
sample.length <- 1000L
rds.simulated.object <- makeRdsSample(
  N.k =true.Nks , 
  b.k = exp(true.log.bks),
  sample.length = sample.length)

# Estimate:
Estimate.b.k(rds.object = rds.simulated.object )
chords:::compareNkEstimate(rds.simulated.object$estimates$Nk.estimates, true.Nks)



