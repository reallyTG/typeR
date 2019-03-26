library(ads)


### Name: Couepia
### Title: Spatial pattern of Couepia caryophylloides in Paracou, a canopy
###   tree species of French Guiana.
### Aliases: Couepia
### Keywords: datasets

### ** Examples

data(Couepia)
coca.spp <- spp(Couepia$trees, mark=Couepia$stage, window=Couepia$rect, triangles=Couepia$tri)
plot(coca.spp)



