library(StatRank)


### Name: Visualization.MultiType
### Title: Multitype Random Utility visualizer
### Aliases: Visualization.MultiType

### ** Examples

library(ggplot2)
library(gridExtra)
Data.Tiny <- matrix(c(1, 2, 3, 3, 2, 1, 1, 2, 3), ncol = 3, byrow = TRUE)
multitype.output <- Estimation.RUM.MultiType.MLE(Data.Tiny, iter = 1, dist = "norm", ratio = .5)
names <- 1:3
#run the following code to make plots
#plots <- Visualization.MultiType(multitype.output, -2, 2, names, 3)



