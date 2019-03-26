library(SimRVPedigree)


### Name: plot.ped
### Title: Plot pedigree
### Aliases: plot.ped

### ** Examples

#Read in age-specific harard data and create hazard object.
data(AgeSpecific_Hazards)
haz_obj <- hazard(hazardDF = AgeSpecific_Hazards)

#Simulate a pedigree ascertained for multiple affecteds
set.seed(2)
RVped2015 <- sim_RVped(hazard_rates = haz_obj,
                       num_affected = 2,
                       ascertain_span = c(1900, 2015),
                       GRR = 30, carrier_prob = 0.002,
                       RVfounder = TRUE,
                       stop_year = 2015,
                       recall_probs = c(1),
                       founder_byears = c(1900, 1905),
                       FamID = 1)[[2]]

summary(RVped2015)

#plot pedigree without age labels
plot(RVped2015)

#plot pedigree with age labels, set the
#reference year to be the ascertainment year
plot(RVped2015, ref_year = "ascYr")

#plot pedigree with age lablels at specified reference years.
plot(RVped2015, ref_year = 2015, cex = 0.75, symbolsize = 0.95)
plot(RVped2015, ref_year = 2005, cex= 0.75, symbolsize = 1.25)
plot(RVped2015, ref_year = 1995, cex= 0.75, symbolsize = 1.25)
plot(RVped2015, ref_year = 1985, cex= 0.75, symbolsize = 1.25)

# plot pedigree generation labels
plot(RVped2015, ref_year = 2015,
     gen_lab = TRUE,
     cex = 0.75, symbolsize = 0.95)

# use gen_stretch to place extra space between generation labels
# NOTE: by default, gen_stretch = 2; increase for extra space.
plot(RVped2015, ref_year = 2015,
     gen_lab = TRUE, gen_stretch = 3,
     cex = 0.75, symbolsize = 0.95)




