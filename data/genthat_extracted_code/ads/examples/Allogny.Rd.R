library(ads)


### Name: Allogny
### Title: Spatial pattern of oaks suffering from frost shake in Allogny,
###   France.
### Aliases: Allogny
### Keywords: datasets

### ** Examples

data(Allogny)
allo.spp <- spp(Allogny$trees, mark=Allogny$status, window=Allogny$rect)
plot(allo.spp)



