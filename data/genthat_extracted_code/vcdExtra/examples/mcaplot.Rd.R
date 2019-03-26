library(vcdExtra)


### Name: mcaplot
### Title: Simple and enhanced plot of MCA solutions
### Aliases: mcaplot
### Keywords: hplot

### ** Examples

require(ca)
data(Titanic)
titanic.mca <- mjca(Titanic)
mcaplot(titanic.mca, legend=TRUE, legend.pos="topleft")

data(HairEyeColor)
haireye.mca <- mjca(HairEyeColor)
mcaplot(haireye.mca, legend=TRUE, cex.lab=1.3)





