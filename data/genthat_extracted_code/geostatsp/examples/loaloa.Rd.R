library(geostatsp)


### Name: loaloa
### Title: Loaloa prevalence data from 197 village surveys
### Aliases: loaloa elevationLoa eviLoa ltLoa tempLoa
### Keywords: datasets

### ** Examples



data("loaloa")
plot(loaloa, main="loaloa villages")

# elevation
plot(elevationLoa, col=terrain.colors(100), main="elevation")
points(loaloa)

# vegetation index
plot(eviLoa, main="evi")
points(loaloa)

plot(tempLoa, main="temperature")
points(loaloa)



# land type, a categorical variable
plot(ltLoa)
mapmisc::legendBreaks("bottomleft",ltLoa, bty='n')
points(loaloa)




