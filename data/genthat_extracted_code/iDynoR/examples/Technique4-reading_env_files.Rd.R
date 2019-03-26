library(iDynoR)


### Name: Technique 4: Reading Solute Grid State (env_State) and Summary (env_Sum) Files
### Title: Technique 4: Reading Solute Grid State (env_State) and Summary
###   (env_Sum) Files
### Aliases: env_returnSimIteration env_returnSimTime
###   env_returnSoluteGridRes env_returnSoluteGridIVoxels
###   env_returnSoluteGridJVoxels env_returnSoluteGridKVoxels
###   env_returnMeanBiofilmThickness env_returnMaxBiofilmThickness
###   env_returnStdDevBiofilmThickness env_returnGlobalProductionRates
###   env_returnConcentrationAndRateChange env_returnSpecifiedSoluteData
### Keywords: env_state env_sum solutes

### ** Examples

## Not run: 
##D # DONTRUN IS SET SO THIS IS NOT EXECUTED WHEN PACKAGE IS COMPILED - BUT THIS
##D # HAS BEEN TESTED THOROUGHLY BEFORE UPLOADING TO THE REPOSITORY
##D 
##D # Read in the results of a particular env state file, in this case iteration 40
##D simResponse<-
##D readSimResultFile("/home/user/iDynoMiCS/results/","env_State",40)
##D 
##D # Get the simulation iteration
##D iteration<-env_returnSimIteration(simResponse)
##D 
##D # Get the simulation time
##D time<-env_returnSimTime(simResponse)
##D 
##D # Get the solute grid information, for a given solute. Let's say the first
##D res<-env_returnSoluteGridRes(simResponse,1)
##D i<-env_returnSoluteGridIVoxels(simResponse,1)
##D j<-env_returnSoluteGridJVoxels(simResponse,1)
##D k<-env_returnSoluteGridKVoxels(simResponse,1)
##D 
##D # Get the biomass thickness information from the file
##D meanThick<-env_returnMeanBiofilmThickness(simResponse)
##D maxThick<-env_returnMaxBiofilmThickness(simResponse)
##D stdDevThick<-env_returnStdDevBiofilmThickness(simResponse)
##D 
##D # Get the global production rates at this timepoint
##D gpr<-env_returnGlobalProductionRates(simResponse)
##D 
##D # Get the concentration and rate change of solutes, at this timepoint
##D c_rc<-env_returnConcentrationAndRateChange(simResponse)
##D 
##D # Get the solute grid information for a particular solute, such as glucose. 
##D #In this example, glucose is the first solute
##D glucoseGrid<-env_returnSpecifiedSoluteData(simResponse, 1)
##D 
## End(Not run)



