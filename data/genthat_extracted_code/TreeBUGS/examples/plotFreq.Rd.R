library(TreeBUGS)


### Name: plotFreq
### Title: Plot Raw Frequencies
### Aliases: plotFreq

### ** Examples

# get frequency data and EQN file
freq <- subset(arnold2013, group == "encoding", select = -(1:4))
eqn <- system.file("MPTmodels/2htsm.eqn", package="TreeBUGS")
plotFreq(freq, eqnfile = eqn)
plotFreq(freq, freq = FALSE, eqnfile = eqn)



