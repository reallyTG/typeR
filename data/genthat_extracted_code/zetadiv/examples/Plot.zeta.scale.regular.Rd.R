library(zetadiv)


### Name: Plot.zeta.scale.regular
### Title: Plotting of zeta diversity scaling with sample grain using
###   hierarchical increases in grain size
### Aliases: Plot.zeta.scale.regular

### ** Examples

utils::data(bird.spec.fine)
xy.bird <- bird.spec.fine[1:400,1:2]
data.spec.bird <- bird.spec.fine[1:400,3:192]

##sam = 25 is used here for fast execution, but a higher value is advised
zeta.scale.reg <- Zeta.scale.regular(xy.bird, data.spec.bird, n = 1:3, order = 3,
    sam = 25, normalize = "Jaccard",plot=FALSE)
dev.new()
Plot.zeta.scale.regular(zeta.scale.reg)



