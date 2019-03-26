library(TreeBUGS)


### Name: genBetaMPT
### Title: Generate Data for Beta MPT Models
### Aliases: genBetaMPT

### ** Examples

# Example: Standard Two-High-Threshold Model (2HTM)
EQNfile <- system.file("MPTmodels/2htm.eqn", package="TreeBUGS")
genDat <- genBetaMPT(N = 100,
                     numItems = c(Target=250, Lure=250),
                     eqnfile = EQNfile,
                     mean = c(Do=.7, Dn=.5, g=.5),
                     sd =   c(Do=.1, Dn=.1, g=.05))
head(genDat$data, 3)
plotFreq(genDat$data, eqn=EQNfile)



