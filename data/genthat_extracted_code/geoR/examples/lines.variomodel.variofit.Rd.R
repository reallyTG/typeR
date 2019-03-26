library(geoR)


### Name: lines.variomodel.variofit
### Title: Adds a Line with a Fitted Variogram Model to a Variogram Plot
### Aliases: lines.variomodel.variofit
### Keywords: spatial aplot

### ** Examples

# compute and plot empirical variogram
vario <- variog(s100, max.dist = 1)
plot(vario)
# estimate parameters
vario.wls <- variofit(vario, ini = c(1, .3), fix.nugget = TRUE)
# adds fitted model to the plot  
lines(vario.wls)



