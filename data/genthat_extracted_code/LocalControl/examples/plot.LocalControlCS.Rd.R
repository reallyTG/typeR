library(LocalControl)


### Name: plot.LocalControlCS
### Title: Plots the local treatment difference as a function of radius for
###   LocalControl.
### Aliases: plot.LocalControlCS

### ** Examples

data(lindner)
# Specify clustering variables.
linVars <- c("stent", "height", "female", "diabetic",
             "acutemi", "ejecfrac", "ves1proc")

# Call Local Control once.
linRes <- LocalControl(data = lindner,
                       clusterVars = linVars,
                       treatmentColName = "abcix",
                       outcomeColName = "cardbill",
                       treatmentCode = 1)

# Plot the local treatment differences from Local Control without
# confidence intervals.
plot(linRes, ylim =  c(-6000, 3600))

#If the confidence intervals are calculated:
#linConfidence = LocalControlNearestNeighborsConfidence(
#                                      data = lindner,
#                                      clusterVars = linVars,
#                                      treatmentColName = "abcix",
#                                      outcomeColName = "cardbill",
#                                      treatmentCode = 1, nBootstrap = 100)

# Plot the local treatment difference with confidence intervals.
#plot(linRes, linConfidence)




