library(SimRVPedigree)


### Name: sim_ped
### Title: Simulate a pedigree
### Aliases: sim_ped

### ** Examples

data(AgeSpecific_Hazards)

# Simulate a random pedigree
set.seed(5)
ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                  GRR = 10,
                  FamID = 1,
                  founder_byears = c(1900, 1910),
                  stop_year = 2015)

# View the simulated pedigree
ex_ped

# Plot the pedigree
plot(ex_ped, location = "topleft")

# Plot the pedigree, this time with age labels for
# all descendents of the starting founder (ID 1)
plot(ex_ped, ref_year = 2015,
     cex= 0.75, symbolsize = 1.25,
     location = "topleft")


# Simulate a random pedigree. This time set RVfounder to TRUE so that
# the eldest introduces a causal rare variant with probability 1.
set.seed(5)
ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                  RVfounder = TRUE,
                  GRR = 10,
                  FamID = 1,
                  founder_byears = c(1900, 1910),
                  stop_year = 2015)


# Plot the pedigree with age labels
plot(ex_ped, ref_year = 2015,
     cex= 0.75, symbolsize = 1.25,
     location = "topleft")




