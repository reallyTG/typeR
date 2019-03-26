library(SimRVPedigree)


### Name: sim_RVped
### Title: Simulate a pedigree ascertained to contain multiple
###   disease-affected relatives
### Aliases: sim_RVped

### ** Examples

#Read in age-specific hazards
data(AgeSpecific_Hazards)

#Simulate pedigree ascertained for multiple affected individuals
set.seed(2)
ex_RVped <- sim_RVped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                      GRR = 20,
                      RVfounder = TRUE,
                      FamID = 1,
                      founder_byears = c(1900, 1905),
                      ascertain_span = c(1995, 2015),
                      num_affected = 2,
                      stop_year = 2017,
                      recall_probs = c(1, 1, 0))

# Observe: ex_RVped is a list containing two ped objects
summary(ex_RVped)

# The first is the original pedigree prior
# to proband selection and trimming
plot(ex_RVped[[1]])

# The second is the ascertained pedigree which
# has been trimmed based on proband recall
plot(ex_RVped[[2]])
summary(ex_RVped[[2]])


# NOTE: by default, RVfounder = FALSE.
# Under this setting pedigrees segregate a causal
# variant with probability equal to carrier_prob.





