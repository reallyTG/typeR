library(overlapptest)


### Name: check.ventana
### Title: Checks for Anticlockwise Vertices
### Aliases: check.ventana
### Keywords: spatial

### ** Examples

data(Astragalus)
# For illustrative purposes, make the vertices of some individual polygon to be listed clockwise
Astragalus.malo<-Astragalus
Astragalus.malo$bdry[[14]]<-lapply(Astragalus.malo$bdry[[14]], rev)
# check and correct
Astragalus.corrected<-(check.ventana(Astragalus.malo))
attributes(Astragalus.corrected)





