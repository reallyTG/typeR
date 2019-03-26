library(IPMpack)


### Name: growthModelComp
### Title: Compares growth and survival objects built from different
###   covariate sets.
### Aliases: growthModelComp survModelComp

### ** Examples

# Data with size and sizeNext
dff <- generateData()

growthModelComp(dff, makePlot = TRUE)
survModelComp(dff, makePlot = TRUE)

growthModelComp(dff, makePlot = TRUE, regressionType = "changingVar")




