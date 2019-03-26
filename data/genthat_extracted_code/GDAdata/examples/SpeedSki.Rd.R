library(GDAdata)


### Name: SpeedSki
### Title: World Speed Skiing Competition, Verbier 21st April, 2011
### Aliases: SpeedSki
### Keywords: datasets

### ** Examples

data(SpeedSki, package="GDAdata")
with(SpeedSki, summary(Speed))
library(ggplot2)
ggplot(SpeedSki, aes(Speed)) + geom_histogram(binwidth=5)



