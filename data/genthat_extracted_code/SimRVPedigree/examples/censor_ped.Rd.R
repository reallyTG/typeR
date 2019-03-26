library(SimRVPedigree)


### Name: censor_ped
### Title: Censor pedigree data
### Aliases: censor_ped

### ** Examples

#Read in age-specific harard data and create hazard object.
data(AgeSpecific_Hazards)
haz_obj <- hazard(hazardDF = AgeSpecific_Hazards)

#Simulate a pedigree ascertained for multiple affecteds
set.seed(3)
RVped2015 <- sim_RVped(hazard_rates = haz_obj,
                       num_affected = 2,
                       ascertain_span = c(1900, 2015),
                       GRR = 30, carrier_prob = 0.002,
                       RVfounder = TRUE,
                       stop_year = 2015,
                       recall_probs = c(1),
                       founder_byears = c(1900, 1905),
                       FamID = 1)[[2]]

# Plot the 2015 pedigree
plot(RVped2015)
mtext(side = 3, line = 2, "Reference Year: 2015")

# Censor RVped2015 after 1960
RVped1960 <- censor_ped(ped_file = RVped2015, censor_year = 1960)

# Plot the 1960 pedigree
plot(RVped1960)
mtext(side = 3, line = 2, "Reference Year: 1960")




