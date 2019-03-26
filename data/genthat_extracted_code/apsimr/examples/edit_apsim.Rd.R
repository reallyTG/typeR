library(apsimr)


### Name: edit_apsim
### Title: Edit an APSIM Simulation
### Aliases: edit_apsim

### ** Examples

## Not run: 
##D #The file I want to edit is called "Canopy.apsim" which is in the directory "~/APSIM"
##D apsimFile <- "Canopy.apsim"
##D apsimWd <- "~/APSIM"
##D 
##D #I want to change the Thickness of the Soilwater, the SoilCN of the SoilOrganicMatter and
##D #the state at which the simulation is being run.
##D apsimVar <- c("SoilWater/Thickness", "SoilOrganicMatter/SoilCN", "State")
##D 
##D #Change SoilWater-Thickness to 200,200,300x9
##D #Change SoilCN to 10
##D #Change "State" to "NSW"
##D apsimValue <- list(c(rep(200, 2), rep(300, 9)), 9, "NSW")
##D 
##D #Edit the apsim file without overwriting it
##D edit_apsim(file = apsimFile, wd = apsimWd, var = apsimVar, value = apsimValue, overwrite = FALSE)
##D 
##D #Run the edited simulation
##D apsimExe <-"C:/Program Files (x86)/Apsim75-r3008/Model/Apsim.exe"
##D 
##D results <- apsim(apsimExe, apsimWd, files = "Canopy-edited.apsim")
##D 
##D #Passing a simulation file to  edit_apsim will give you a warning and redirect it to edit_sim_file
##D simFile <- "Soil.xml"
##D simValue <- list(abs(rnorm(1)), abs(rnorm(1)), c(0,2,2,1))
##D simVar <- c("nitrification_pot", "dnit_nitrf_loss","wfnit_values")
##D edit_apsim(file = simFile, wd = apsimWd, var = simVar, value = simValue, overwrite = FALSE)
## End(Not run)



