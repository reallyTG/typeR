library(SimRVPedigree)


### Name: summary.ped
### Title: Summarize a sample of pedigrees
### Aliases: summary.ped

### ** Examples

#Read in age-specific harard data and create hazard object.
data(AgeSpecific_Hazards)
haz_obj <- hazard(hazardDF = AgeSpecific_Hazards)

#Simulate a pedigree ascertained for multiple affecteds
set.seed(6)
RVped2015 <- sim_RVped(hazard_rates = haz_obj,
                       num_affected = 2,
                       ascertain_span = c(1900, 2015),
                       GRR = 30, carrier_prob = 0.002,
                       RVfounder = TRUE,
                       stop_year = 2015,
                       recall_probs = c(1),
                       founder_byears = c(1900, 1925),
                       FamID = 1)[[2]]

# Plot the pedigree with age labels at the year 2015
plot(RVped2015, ref_year = 2015)

# View summary information for the pedigree
summary(RVped2015)



# Import the EgPeds dataset and create ped object
data(EgPeds)
study_peds <- new.ped(EgPeds)

# View summary information for study_peds
summary(study_peds)




