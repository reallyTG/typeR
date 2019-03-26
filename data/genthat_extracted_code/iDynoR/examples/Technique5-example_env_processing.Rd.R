library(iDynoR)


### Name: Technique 5: Example Methods for Processing Solute Information
### Title: Technique 5: Example Methods for Processing Solute Information
### Aliases: env_soluteProductionRateOverTime plotContour
### Keywords: env_state env_sum graphs example-methods

### ** Examples

## Not run: 
##D # DONTRUN IS SET SO THIS IS NOT EXECUTED WHEN PACKAGE IS COMPILED - BUT THIS
##D # HAS BEEN TESTED THOROUGHLY BEFORE UPLOADING TO THE REPOSITORY
##D 
##D # Track the production or consumption rate of glucose (first solute) over time, 
##D # for 48 timepoints, where the output period was 1 (every step)
##D glucoseProduction<-
##D env_soluteProductionRateOverTime("/home/user/iDynoMiCS/results/", 
##D "env_Sum", 48, 1,1)
##D 
##D # Plot the contour for glucose (1) at timepoint 40
##D plotContour("/home/user/Desktop/iDynoMiCS/results/single_species/", 40, 1, 
##D "/home/user/Desktop/iDynoMiCS/results/single_species/graphs/")
##D 
## End(Not run)



