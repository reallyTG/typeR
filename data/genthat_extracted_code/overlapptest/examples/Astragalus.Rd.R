library(overlapptest)


### Name: Astragalus
### Title: Astragalus and Sesleria Plants
### Aliases: Astragalus Sesleria
### Keywords: datasets

### ** Examples

data(Astragalus)
Astragalus
plot(Astragalus)
# total area covered by Astragalus
area.owin(Astragalus)
# number of individual polygons
length(Astragalus$bdry)
# area of each individual 
sapply(Astragalus$bdry, function(x) area.owin(owin(poly=x)))



