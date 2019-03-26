library(LocalControl)


### Name: LocalControlNearestNeighborsConfidence
### Title: Provides a bootstrapped confidence interval estimate for
###   LocalControl LTDs.
### Aliases: LocalControlNearestNeighborsConfidence

### ** Examples

## Not run: 
##D #input the abciximab study data of Kereiakes et al. (2000).
##D data(lindner)
##D 
##D linVars <- c("stent", "height", "female", "diabetic", "acutemi",
##D              "ejecfrac", "ves1proc")
##D results <- LocalControl(data = lindner,
##D                         clusterVars = linVars,
##D                         treatmentColName = "abcix",
##D                         outcomeColName = "cardbill",
##D                         treatmentCode = 1)
##D 
##D #Calculate the confidence intervals via resampling.
##D confResults = LocalControlNearestNeighborsConfidence(
##D                                         data = lindner,
##D                                         clusterVars = linVars,
##D                                         treatmentColName = "abcix",
##D                                         outcomeColName = "cardbill",
##D                                         treatmentCode = 1, nBootstrap = 20)
##D 
##D # Plot the local treatment difference with confidence intervals.
##D plot(results, confResults)
## End(Not run)




