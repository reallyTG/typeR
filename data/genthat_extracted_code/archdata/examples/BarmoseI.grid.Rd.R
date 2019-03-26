library(archdata)


### Name: BarmoseI.grid
### Title: Flakes per grid unit from Barmose I, South Zealand, Denmark
### Aliases: BarmoseI.grid
### Keywords: datasets

### ** Examples

data(BarmoseI.grid)
plot(North~East, BarmoseI.grid, xlim=c(0, 12), ylim=c(0, 14), type="n", asp=1)
with(BarmoseI.grid, text(East+.5, North+.5, Debitage, cex=.8))



