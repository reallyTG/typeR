library(zetadiv)


### Name: rescale.regular
### Title: Rescaling of data following a hierarchical increase in grain
###   size
### Aliases: rescale.regular

### ** Examples


utils::data(bird.spec.fine)
xy.bird <- bird.spec.fine[1:2]
data.spec.bird <- bird.spec.fine[3:192]

data.rescale <- rescale.regular(xy.bird, data.spec.bird, n = 4)



