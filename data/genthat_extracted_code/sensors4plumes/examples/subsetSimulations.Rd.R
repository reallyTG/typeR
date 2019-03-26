library(sensors4plumes)


### Name: subset.Simulations
### Title: Subsetting Simulations
### Aliases: subset.Simulations subset

### ** Examples

## Not run: 
##D ## may create files
##D data(SimulationsSmall)
##D 
##D SimulationsSmall_a = subset(SimulationsSmall, locations = c(2,4,6,8))
##D SimulationsSmall_b = subset(SimulationsSmall, 
##D                             locations = 1:5, plumes = c(2,4), kinds = 1, 
##D                             dataPlumes = 1:2)
##D                             
##D # effect of 'valuesOnly'
##D data(radioactivePlumes)
##D locations1 = sample(nLocations(radioactivePlumes), 15)
##D plumes1 = sample(nPlumes(radioactivePlumes), 15)
##D subset_fm_RNA = subset(radioactivePlumes, 
##D                        plumes = c(plumes1, NA, 10000, NA, 0, plumes1), 
##D                        locations = c(locations1, NA, 10000, NA, 0,locations1))
##D                         
##D subset_mf_RNA_vO = subset(radioactivePlumes, 
##D                           plumes = c(plumes1, NA, 0, 10000, NA, plumes1), 
##D                           locations = c(locations1, NA, NA, 10000, 0, 0, locations1),
##D                           valuesOnly = TRUE)  
##D image(subset_fm_RNA@values) 
##D image(subset_mf_RNA_vO)   # with repetitions
## End(Not run)



