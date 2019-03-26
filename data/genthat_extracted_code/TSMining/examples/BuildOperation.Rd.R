library(TSMining)


### Name: BuildOperation
### Title: An example 1-week data set containing the power consumption data
###   of two building services sub-systems
### Aliases: BuildOperation
### Keywords: datasets

### ** Examples

library(ggplot2)
data(BuildOperation)
ggplot(data = BuildOperation, aes(x = 1:dim(BuildOperation)[1], y = WCC)) +
 geom_line() + geom_point()
ggplot(data = BuildOperation, aes(x = 1:dim(BuildOperation)[1], y = AHU)) +
 geom_line() + geom_point()



