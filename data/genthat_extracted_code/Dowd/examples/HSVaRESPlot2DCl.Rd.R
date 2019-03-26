library(Dowd)


### Name: HSVaRESPlot2DCl
### Title: Plots historical simulation VaR and ES against confidence level
### Aliases: HSVaRESPlot2DCl

### ** Examples

# Plots historical simulation VaR and ES against confidence level
   Ra <- rnorm(100)
   cl <- seq(.90, .99, .01)
   HSVaRESPlot2DCl(Ra, cl)



