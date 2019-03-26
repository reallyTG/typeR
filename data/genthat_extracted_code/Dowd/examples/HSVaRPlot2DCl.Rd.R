library(Dowd)


### Name: HSVaRPlot2DCl
### Title: Plots historical simulation VaR against confidence level
### Aliases: HSVaRPlot2DCl

### ** Examples

# Plots historical simulation VaR against confidence level
   Ra <- rnorm(100)
   cl <- seq(.90, .99, .01)
   HSVaRPlot2DCl(Ra, cl)



