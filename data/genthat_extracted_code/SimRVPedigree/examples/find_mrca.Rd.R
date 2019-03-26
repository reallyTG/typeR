library(SimRVPedigree)


### Name: find_mrca
### Title: Find the most recent common ancestor of two pedigree members
### Aliases: find_mrca

### ** Examples

library(SimRVPedigree)
data(AgeSpecific_Hazards)


set.seed(5)
ex_ped <- sim_ped(hazard_rates = hazard(hazardDF = AgeSpecific_Hazards),
                  GRR = 10, FamID = 1,
                  founder_byears = c(1800, 1900),
                  stop_year = 2020)

plot(ex_ped)

# Find most recent common ancestor of individuals with IDs 19 and 21
find_mrca(ped = ex_ped, ID1 = 19, ID2 = 21)

# Note that someone can be their own most recent common ancestor.
# In the following example, since the individual with ID 8 is the grandmother
# of the individual with ID 21, the find_mrca function returns 8.
find_mrca(ped = ex_ped, ID1 = 8, ID2 = 21)

# For unrelated individuals, the find_mcra function returns NA
find_mrca(ped = ex_ped, ID1 = 8, ID2 = 15)
find_mrca(ped = ex_ped, ID1 = 5, ID2 = 4)




