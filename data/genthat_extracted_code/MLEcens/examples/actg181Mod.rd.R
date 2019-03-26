library(MLEcens)


### Name: actg181Mod
### Title: Modified data from the Aids Clinical Trials Group protocol ACTG
###   181
### Aliases: actg181Mod
### Keywords: datasets

### ** Examples

# Load the data
data(actg181Mod)

# Compute the MLE
mle <- computeMLE(R=actg181Mod, B=c(1,1,1,1))

# Create density plots
par(mfrow=c(2,2))

# Bivariate density plot
plotDens2(mle, main="Bivariate density",
 xlab="time to CMV shedding (months)", 
 ylab="time to MAC colonization (months)")

# Marginal density plot for time to MAC colonization
plotDens1(mle, margin=2, main="Density for time
 to MAC colonization", xlab="t (months)", 
 ylab="density")

# Marginal density plot for time to CMV shedding
plotDens1(mle, margin=1, main="Density for time 
 to CMV shedding", xlab="t (months)", 
 ylab="density")

# Note that many maximal intersections extend to 
# infinity, and hence the value of the density is
# not very meaningful. 



