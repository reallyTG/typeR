library(nicheROVER)


### Name: niche.plot
### Title: Plot for 2-d projection of niche regions
### Aliases: niche.plot

### ** Examples

data(fish) # 4 fish, 3 isotopes

# generate 10 parameter draws from the posteriors of each fish with default prior
nsamples <- 10
fish.par <- tapply(1:nrow(fish), fish$species,
                  function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))

# format data for plotting function
fish.data <- tapply(1:nrow(fish), fish$species, function(ii) X = fish[ii,2:4])

clrs <- c("black", "red", "blue", "orange") # colors for each species
niche.plot(niche.par = fish.par, niche.data = fish.data, pfrac = .1,
          iso.names = expression(delta^{15}*N, delta^{13}*C, delta^{34}*S),
          col = clrs, xlab = expression("Isotope Ratio (\u2030)"))



