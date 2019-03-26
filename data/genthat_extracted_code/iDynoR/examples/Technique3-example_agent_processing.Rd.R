library(iDynoR)


### Name: Technique 3: Example Methods for Processing Agent Information
### Title: Technique 3: Example Methods for Processing Agent Information
### Aliases: agent_getMeasureOverTime plotAgents
###   getSpeciesSpecificAbundance plotTimeCourseAgents simpsonIndex
###   getSpeciesAbundance plotTimeCourseAbund
### Keywords: agent_state agent_sum graphs example-methods

### ** Examples

## Not run: 
##D # DONTRUN IS SET SO THIS IS NOT EXECUTED WHEN PACKAGE IS COMPILED - BUT THIS
##D # HAS BEEN TESTED THOROUGHLY BEFORE UPLOADING TO THE REPOSITORY
##D 
##D # Track the biomass of Pseudomonas over time, for 48 timepoints
##D # with an output period of 1
##D totalBiomass<-agent_getMeasureOverTime("/home/user/iDynoMiCS/results/", 
##D "agent_State", 48, 1, "Pseudomonas", "biomass")
##D 
##D # Plot all the agents in the simulation at the 24th timestep
##D plotAgents("/home/user/iDynoMiCS/results/", 24, "/home/user/iDynoMiCS/results")
##D 
##D # Get the abundance of each species throughout a simulation of 48 timepoints
##D # with an output period of 1
##D speciesAbundance<-getSpeciesSpecificAbundance("/home/user/iDynoMiCS/results/", 
##D 48,1)
##D 
##D # Plot the abundance of each species, 48 timepoints, output period of 1
##D plotTimeCourseAgents("/home/user/iDynoMiCS/results/", 48, 1,
##D "/home/user/Desktop/iDynoMiCS/results/single_species/graphs/")
##D 
##D # Produce a diversity plot of this information, and store the data in the graph
##D # 48 timepoints, output period of 1
##D simpsonData<-simpsonIndex("/home/user/iDynoMiCS/results/", 48, 1,
##D "/home/user/Desktop/iDynoMiCS/results/single_species/graphs/")
##D 
##D # Get the total abundance of individuals throughout the simulation
##D # 48 timepoints, output period of 1
##D totalAbundance<-getSpeciesAbundance("/home/user/iDynoMiCS/results/", 48, 1)
##D 
##D # Plot the total abundance. 48 timepoints, output period of 1
##D plotTimeCourseAbund("/home/user/iDynoMiCS/results/", 48, 1,
##D "/home/user/iDynoMiCS/results/graphs/")
##D 
## End(Not run)



