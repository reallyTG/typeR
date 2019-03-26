library(betapart)


### Name: beta.sample
### Title: Resampling multiple-site dissimilarity for n sites
### Aliases: beta.sample

### ** Examples

# Read the data for Northern and Southern European cerambycids
data(ceram.s)
data(ceram.n)

# Resample 100 times the multiple-site dissimilarities
# for 10 countries.
beta.ceram.s<-beta.sample(ceram.s, index.family="sor", sites=10, samples=100)
beta.ceram.n<-beta.sample(ceram.n, index.family="sor", sites=10, samples=100)

# Plot the distributions of beta.SIM in Southern Europe (red) 
# and Northern Europe (blue)
plot(density(beta.ceram.s$sampled.values$beta.SIM), col="red", xlim=c(0,1))
lines(density(beta.ceram.n$sampled.values$beta.SIM), col="blue")

# Compute the p-value of difference in beta.SIM between South and North 
# (i.e. the probability of finding in the North a higher value than 
# in the South)
p.value.beta.SIM<-length(which(beta.ceram.s$sampled.values$beta.SIM<
beta.ceram.n$sampled.values$beta.SIM))/100

p.value.beta.SIM
# The result is 0 and we used 100 samples, so p<0.01



