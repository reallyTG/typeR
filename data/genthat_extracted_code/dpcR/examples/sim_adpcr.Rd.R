library(dpcR)


### Name: sim_adpcr
### Title: Simulate Array Digital PCR
### Aliases: sim_adpcr
### Keywords: datagen

### ** Examples


# Simulation of a digital PCR experiment with a chamber based technology.
# The parameter pos_sums was altered to change how the total number of positive 
# chamber per panel are returned. An alteration of the parameter has an impact 
# in the system performance.
adpcr_big <- sim_adpcr(m = 10, n = 40, times = 1000, pos_sums = FALSE, n_panels = 1000)
adpcr_small <- sim_adpcr(m = 10, n = 40, times = 1000, pos_sums = TRUE, n_panels = 1000)
# with pos_sums = TRUE, output allocates less memory
object.size(adpcr_big)
object.size(adpcr_small)

# Mini version of Dube et al. 2008 experiment, full requires replic <- 70000
# The number of replicates was reduced by a factor of 100 to lower the computation time.
replic <- 700
dube <- sim_adpcr(400, 765, times = replic, dube = TRUE, 
    pos_sums = TRUE, n_panels = replic)
mean(dube) # 311.5616
sd(dube) # 13.64159

# Create a barplot from the simulated data similar to Dube et al. 2008
bp <- barplot(table(factor(dube, levels = min(dube):max(dube))), 
	      space = 0)
lines(bp, dnorm(min(dube):max(dube), mean = 311.5, sd = 13.59)*replic, 
      col = "green", lwd = 3)

# Exact Dube's method is a bit slower than other one, but more accurate
system.time(dub <- sim_adpcr(m = 400, n = 765, times = 500, n_panels = 500, 
  pos_sums = TRUE))
system.time(mul <- sim_adpcr(m = 400, n = 765, times = 500, n_panels = 500, 
  pos_sums = FALSE))




