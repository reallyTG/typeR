library(nicheROVER)


### Name: overlap.plot
### Title: Plot the overlap metric
### Aliases: overlap.plot

### ** Examples

# fish data
data(fish)

# parameter draws from the "default" posteriors of each fish
nsamples <- 500
system.time({
 fish.par <- tapply(1:nrow(fish), fish$species,
                    function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))
})

# overlap calculation
system.time({
 over <- overlap(fish.par, nreps = nsamples, nprob = nsamples, alpha = c(.95, .99))
})

# overlap plot
clrs <- c("black", "red", "blue", "orange") # color for each species
ii <- 1 # which niche region alpha level to use
overlap.plot(over[,,,ii], col = clrs, mean.cred.col = "turquoise",
            xlab = paste0("Overlap Probability (%) -- Niche Region Size: ",
                          dimnames(over)[[4]][ii]))



