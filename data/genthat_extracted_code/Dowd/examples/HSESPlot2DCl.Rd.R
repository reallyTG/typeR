library(Dowd)


### Name: HSESPlot2DCl
### Title: Plots historical simulation ES against confidence level
### Aliases: HSESPlot2DCl

### ** Examples

# Plots historical simulation ES against confidence level
   Ra <- rnorm(100)
   cl <- seq(.90, .99, .01)
   HSESPlot2DCl(Ra, cl)



