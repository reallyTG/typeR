library(Dowd)


### Name: FrechetESPlot2DCl
### Title: Plots Frechet Expected Shortfall against confidence level
### Aliases: FrechetESPlot2DCl

### ** Examples

# Plots ES against vector of cl assuming Frechet Distribution for given parameters
   cl <- seq(0.9,0.99,0.01)
   FrechetESPlot2DCl(3.5, 2.3, 1.6, 10, cl, 30)



