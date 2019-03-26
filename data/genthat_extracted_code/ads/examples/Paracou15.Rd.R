library(ads)


### Name: Paracou15
### Title: Tree spatial pattern in control plot 15, Paracou experimental
###   station, French Guiana
### Aliases: Paracou15
### Keywords: dataset

### ** Examples

data(Paracou15)
P15.spp <- spp(Paracou15$trees, mark = Paracou15$species, window = Paracou15$rect)
plot(P15.spp, chars = rep("o", 332), cols = rainbow(332), legend = FALSE, maxsize = 0.5)



