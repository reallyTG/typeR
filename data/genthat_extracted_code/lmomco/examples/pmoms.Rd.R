library(lmomco)


### Name: pmoms
### Title: The Sample Product Moments: Mean, Standard Deviation, Skew, and
###   Excess Kurtosis
### Aliases: pmoms
### Keywords: product moment

### ** Examples

# A simple example
PM <- pmoms(rnorm(1000)) # n standard normal values as a fake data set.
cat(c(PM$moments[1],PM$moments[2],PM$ratios[3],PM$ratios[4],"\n"))
# As sample size gets very large the four values returned should be
# 0,1,0,0 by definition of the standard normal distribution.

# A more complex example
para <- vec2par(c(100,500,3),type='pe3') # mean=100, sd=500, skew=3
# The Pearson type III distribution is implemented here such that
# the "parameters" are equal to the mean, standard deviation, and skew.
simDATA <- rlmomco(100,para) # simulate 100 observations
PM <- pmoms(simDATA) # compute the product moments

p.tmp <- c(PM$moments[1],PM$moments[2],PM$ratios[3])
cat(c("Sample P-moments:",p.tmp,"\n"))
# This distribution has considerable variation and large skew. Stability
# of the sample product moments requires LARGE sample sizes (too large
# for a builtin example)

# Continue the example through the L-moments
lmr <- lmoms(simDATA) # compute the L-moments
epara <- parpe3(lmr) # estimate the Pearson III parameters. This is a
# hack to back into comparative estimates of the product moments. This
# can only be done because we know that the parent distribution is a
# Pearson Type III

l.tmp <- c(epara$para[1],epara$para[2],epara$para[3])
cat(c("PearsonIII by L-moments:",l.tmp,"\n"))
# The first values are the means and will be identical and close to 100.
# The second values are the standard deviations and the L-moment to
#   PearsonIII will be closer to 500 than the product moment (this
#   shows the raw power of L-moment based analysis---they work).
# The third values are the skew. Almost certainly the L-moment estimate
#   of skew will be closer to 3 than the product moment.



