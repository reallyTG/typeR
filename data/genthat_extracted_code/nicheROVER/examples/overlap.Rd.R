library(nicheROVER)


### Name: overlap
### Title: Monte Carlo calculation of niche region overlap metrics
### Aliases: overlap

### ** Examples

# fish data
data(fish)

# generate parameter draws from the "default" posteriors of each fish
nsamples <- 500
system.time({
 fish.par <- tapply(1:nrow(fish), fish$species,
                    function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))
})

# overlap calculation. use nsamples = nprob = 1e4 for more accurate results.
system.time({
 over <- overlap(fish.par, nreps = nsamples, nprob = nsamples, alpha = c(.95, .99))
})

# posterior expectations of overlap metrics
over.mean <- apply(over*100, c(1:2, 4), mean)
round(over.mean)

# posterior 95% credible intervals of overlap metrics
over.cred <- apply(over*100, c(1:2, 4), quantile, prob = c(.025, .975), na.rm = TRUE)
round(over.cred[,,,1]) # display alpha = .95 niche region



