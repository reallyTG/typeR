library(zetadiv)


### Name: Zeta.scale.regular
### Title: Zeta diversity scaling with sample grain using hierarchical
###   increases in grain size
### Aliases: Zeta.scale.regular

### ** Examples

utils::data(bird.spec.fine)
xy.bird <- bird.spec.fine[1:400,1:2]
data.spec.bird <- bird.spec.fine[1:400,3:192]

dev.new()
##sam = 25 is used here for fast execution, but a higher value is advised
zeta.scale.reg <- Zeta.scale.regular(xy.bird, data.spec.bird, n = 1:3, order = 3,
    sam = 25, normalize = "Jaccard")



