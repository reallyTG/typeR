library(iDynoR)


### Name: Technique 2: Reading Agent State and Agent Sum Files
### Title: Technique 2: Reading Agent State and Agent Sum Files
### Aliases: agent_returnSimIteration agent_returnSimTime
###   agent_returnGridResolution agent_returnIVoxels agent_returnJVoxels
###   agent_returnKVoxels agent_returnSpeciesResultData
###   agent_returnNumSpecies agent_returnSpeciesColumnTotal
### Keywords: agent_state agent_sum species

### ** Examples

## Not run: 
##D # DONTRUN IS SET SO THIS IS NOT EXECUTED WHEN PACKAGE IS COMPILED - BUT THIS
##D # HAS BEEN TESTED THOROUGHLY BEFORE UPLOADING TO THE REPOSITORY
##D 
##D # Read in the results of a particular agent state file, at timestep 40
##D simResponse<-
##D readSimResultFile("/home/user/iDynoMiCS/results/","agent_State",40)
##D 
##D # Get the simulation iteration
##D iteration<-agent_returnSimIteration(simResponse)
##D 
##D # Get the simulation time
##D time<-agent_returnSimTime(simResponse)
##D 
##D # Get the simulation domain information (sizes and resolution)
##D res<-agent_returnGridResolution(simResponse)
##D i<-agent_returnIVoxels(simResponse)
##D j<-agent_returnJVoxels(simResponse)
##D k<-agent_returnKVoxels(simResponse)
##D 
##D # Get all the species information from the file, and the number of species in the file
##D allSpecies<-agent_returnSpeciesResultData(simResponse)
##D numSpecies<-agent_returnNumSpecies(allSpecies)
##D 
##D # Total the biomass column for each individual of a species (for example, Pseudomonas)
##D biomassTotal<-
##D agent_returnSpeciesColumnTotal(allSpecies, "Pseudomonas", "biomass")
##D 
## End(Not run)



