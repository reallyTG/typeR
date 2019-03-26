library(geoR)


### Name: plot.geodata
### Title: Exploratory Geostatistical Plots
### Aliases: plot.geodata
### Keywords: spatial dplot

### ** Examples

require(geoR)
plot(s100)
plot(s100, scatter3d=TRUE)
plot(s100, qt.col=1)

plot(ca20, bor=borders)          # original data
plot(ca20, trend=~altitude+area) # residuals from an external trend
plot(ca20, trend='1st')          # residuals from a polynomial trend

plot(sic.100, bor=sic.borders)           # original data
plot(sic.100, bor=sic.borders, lambda=0) # logarithm of the data



