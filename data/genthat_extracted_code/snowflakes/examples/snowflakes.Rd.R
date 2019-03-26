library(snowflakes)


### Name: snowflakes
### Title: Plots Randomly Generated Snowflakes
### Aliases: snowflakes
### Keywords: ~snowflakes ~plot

### ** Examples

t = seq(0, 5*pi, .5)
xCoor = t*cos(t)
yCoor = t*sin(t)
radius = 1
orientation = runif(length(xCoor))*(pi/6)

set.seed(1)

plot(xCoor, yCoor, type="l", axes = TRUE, ylab="", xlab="",
ylim = range(yCoor) + radius*c(-1, 1)*3,
xlim = range(xCoor) + radius*c(-1, 1)*0, col=gray(.9))

returnedSeeds = snowflakes(xCoor = xCoor, yCoor = yCoor, radius = radius,
  orientation = orientation, seeds = 1:3,
  color = gray((1:length(xCoor))/(length(xCoor)+1)), anotherColor = "gray")



