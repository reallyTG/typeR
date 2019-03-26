library(MADPop)


### Name: hUM.post
### Title: Posterior sampling from a hierarchical Unconstrained-Multinomial
###   model
### Aliases: hUM.post

### ** Examples

# fit hierarchical model to fish215 data

# only output posterior samples for lake Simcoe
rhoId <- "Simcoe"
nsamples <- 500
hUM.fit <- hUM.post(nsamples = nsamples, X = fish215,
                    rhoId = rhoId,
                    chains = 1) # number of MCMC chains

# plot first 20 posterior probabilities in lake Simcoe
rho.post <- hUM.fit$rho[,1,]
boxplot(rho.post[,1:20], las = 2,
        xlab = "Genotype", ylab = "Posterior Probability",
        pch = ".", col = "grey")



