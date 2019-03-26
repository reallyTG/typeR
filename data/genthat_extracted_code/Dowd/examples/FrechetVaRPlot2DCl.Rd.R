library(Dowd)


### Name: FrechetVaRPlot2DCl
### Title: Plots Frechet Value at Risk against Cl
### Aliases: FrechetVaRPlot2DCl

### ** Examples

# Plots VaR against vector of cl assuming Frechet Distribution for given parameters
   cl <- seq(0.9, .99, .01)
   FrechetVaRPlot2DCl(3.5, 2.3, 1.6, 10, cl, 30)



