library(nicheROVER)


### Name: nicheROVER
### Title: (Niche) (R)egion and Niche (Over)lap Metrics for
###   Multidimensional Ecological Niches.
### Aliases: nicheROVER nicheROVER-package

### ** Examples

# analysis for fish data

data(fish) # 4 fish, 3 isotopes
aggregate(fish[2:4], fish[1], mean) # isotope means per fish

# random draws from posterior distribution with default prior
nsamples <- 500
fish.par <- tapply(1:nrow(fish), fish$species,
                  function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))

# display p(mu | X) and p(Sigma | X) for each fish
clrs <- c("black", "red", "blue", "orange") # colors for each species
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(fish.par, col = clrs)
legend(x = "topright", legend = names(fish.par), fill = clrs)

# 2-d projections of 10 niche regions
nsamples <- 10
fish.par <- tapply(1:nrow(fish), fish$species,
                  function(ii) niw.post(nsamples = nsamples, X = fish[ii,2:4]))

# format data for plotting function
fish.data <- tapply(1:nrow(fish), fish$species, function(ii) X = fish[ii,2:4])

niche.plot(niche.par = fish.par, niche.data = fish.data, pfrac = .05,
          iso.names = expression(delta^{15}*N, delta^{13}*C, delta^{34}*S),
          col = clrs, xlab = expression("Isotope Ratio (\u2030)"))

# niche overlap plots for 95% niche region sizes

# overlap calculation.  use nsamples = nprob = 1e4 for higher accuracy.
nsamples <- 500
over.stat <- overlap(fish.par, nreps = nsamples, nprob = nsamples, alpha = .95)

# overlap plot
overlap.plot(over.stat, col = clrs, mean.cred.col = "turquoise", equal.axis = TRUE,
            xlab = "Overlap Probability (%) -- Niche Region Size: 95%")



