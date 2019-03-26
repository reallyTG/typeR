library(apsimr)


### Name: edit_sim_file
### Title: Edit an APSIM Module File
### Aliases: edit_sim_file

### ** Examples

## Not run: 
##D #The file I want to edit is called "Soil.xml" which is the the directory "~/APSIM"
##D simFile <- "Soil.xml"
##D apsimWd <- "~/APSIM"
##D 
##D #I want to change the potential nitrification and N2O from nitrification
##D simVar <- c("nitrification_pot", "dnit_nitrf_loss","wfnit_values")
##D 
##D #Change both to absolute values of random N(0,1)
##D simValue <- list(abs(rnorm(1)), abs(rnorm(1)), c(0,2,2,1))
##D 
##D #Edit Soil.xml without overwriting it
##D edit_sim_file(file = simFile, wd = apsimWd, var = simVar, value = simValue, overwrite = FALSE)
##D 
##D #Passing an .apsim file to edit_sim_file will give a warning and redirect it to edit_apsim
##D apsimFile <- "Canopy.apsim"
##D apsimValue <- list(c(rep(200, 2), rep(300, 9)), 9, "NSW")
##D apsimVar <- c("SoilWater/Thickness", "SoilOrganicMatter/SoilCN", "State")
##D edit_sim_file(file = apsimFile, wd = apsimWd, var = apsimVar, value = apsimValue, overwrite = FALSE)
## End(Not run)



