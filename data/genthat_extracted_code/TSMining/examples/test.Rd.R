library(TSMining)


### Name: test
### Title: An example data set for univariate motif discovery
### Aliases: test
### Keywords: datasets

### ** Examples

library(ggplot2)
data(test)
ggplot(data = test, aes(x = 1:dim(test)[1], y = TS1)) + geom_line() + geom_point()
ggplot(data = test, aes(x = 1:dim(test)[1], y = TS2)) + geom_line() + geom_point()



