library(circular)


### Name: turtles
### Title: Arrival directions of displaced sea turtles
### Aliases: turtles
### Keywords: datasets

### ** Examples

data(turtles)
turtles[,2] <- circular(turtles[,2], units='degrees', template='geographics')
plot(turtles[,2])



