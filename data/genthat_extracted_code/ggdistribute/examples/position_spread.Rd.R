library(ggdistribute)


### Name: position_spread
### Title: Spread Overlapping Grobs Spread overlapping groups by shrinking
###   them to fit within the data's 'y' range.
### Aliases: position_spread

### ** Examples

library(ggplot2)

x <- data.frame(y = rnorm(1000), x="", myGroup=sample(1:3, 1000, TRUE))

ggplot(x, aes(x, y))+
geom_point(aes(group=myGroup), position=position_spread(height = 0.5))



