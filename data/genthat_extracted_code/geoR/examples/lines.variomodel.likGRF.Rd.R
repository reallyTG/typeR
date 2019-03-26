library(geoR)


### Name: lines.variomodel.likGRF
### Title: Adds a Variogram Line to a Variogram Plot
### Aliases: lines.variomodel.likGRF
### Keywords: spatial aplot

### ** Examples

# compute and plot empirical variogram
vario <- variog(s100, max.dist = 1)
plot(vario)
# estimate parameters
vario.ml <- likfit(s100, ini = c(1, .3), fix.nugget = TRUE)
# adds fitted model to the plot  
lines(vario.ml)



