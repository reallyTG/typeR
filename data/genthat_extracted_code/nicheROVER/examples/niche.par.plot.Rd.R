library(nicheROVER)


### Name: niche.par.plot
### Title: Plot for niche parameters
### Aliases: niche.par.plot

### ** Examples

# fish data
data(fish)

# generate parameter draws from the "default" posteriors of each fish
nsamples <- 1e3
system.time({
 fish.par <- tapply(1:nrow(fish), fish$species,
                    function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))
})

# various parameter plots
clrs <- c("black", "red", "blue", "orange") # colors for each species

# mu1, mu2, and Sigma12
par(mar = c(4, 4, .5, .1)+.1, mfrow = c(1,3))
niche.par.plot(fish.par, col = clrs, plot.index = 1)
niche.par.plot(fish.par, col = clrs, plot.index = 2)
niche.par.plot(fish.par, col = clrs, plot.index = 1:2)
legend("topright", legend = names(fish.par), fill = clrs)

# all mu
niche.par.plot(fish.par, col = clrs, plot.mu = TRUE, plot.Sigma = FALSE)
legend("topright", legend = names(fish.par), fill = clrs)

# all mu and Sigma
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(fish.par, col = clrs, plot.mu = TRUE, plot.Sigma = TRUE)
legend("topright", legend = names(fish.par), fill = clrs)



