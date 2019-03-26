## ---- echo=TRUE, results='asis'------------------------------------------
library('snowflakes')

## ---- echo=TRUE, fig.show='hold', fig.height = 7, fig.width = 7, fig.cap = "Quadratic function plotted using snowflakes (in transparent gray) instead of points."----
xCoor = seq(0, 2, .25)
yCoor = (xCoor-1)^2
radius = 0.1

set.seed(1)

par(mar = c(0, 0, 0, 0))
plot(xCoor, yCoor, type="l", axes = FALSE, ylab="", xlab="", ylim = range(yCoor) + radius*c(-1, 1)*0.7, xlim = range(xCoor) + radius*c(-1, 1)*0.7, col=gray(.9))

snowflakes(xCoor = xCoor, yCoor = yCoor, radius = radius, color = "#22222222")

## ---- echo=TRUE, fig.show='hold', fig.height = 5, fig.width = 5, fig.cap = "Same snowflake pattern, but different crystal widths."----
xCoor = seq(0, 1, .25)
yCoor = xCoor
radius = 0.15

set.seed(1)

par(mar = c(0, 0, 0, 0))
plot(xCoor, yCoor, type="l", axes = FALSE, ylab="", xlab="",
ylim = range(yCoor) + radius*c(-1, 1)*0.7,
xlim = range(xCoor) + radius*c(-1, 1)*0.7, col=gray(.9))

returnedSeeds = snowflakes(xCoor = xCoor, yCoor = yCoor, radius = radius, seeds = c(9492), deltaCoef = 15 - (0:(length(xCoor)-1))*3, color = "#22222222")

## ---- echo=TRUE, fig.show='hold', fig.height = 5, fig.width = 7, fig.cap = "Snowflake spiral with each snowflake oriented toward the center of the spiral (well, almost)."----
t = seq(0, 5*pi, .5)
xCoor = t*cos(t)
yCoor = t*sin(t)
radius = seq(.6, 1.8, 1.2/(length(t)-1))
orientation = -(pi + t)

set.seed(1)

par(mar = c(0, 0, 0, 0))
plot(xCoor, yCoor, type="l", axes = FALSE, ylab="", xlab="",
ylim = range(yCoor) + max(radius)*c(-1, 1)*0.5,
xlim = range(xCoor) + max(radius)*c(-1, 1)*0.5, col=gray(.9), asp = 2/3)

segments(x0 = rep(0, length(xCoor)), y0 = rep(0, length(xCoor)), x1 = xCoor, y1 = yCoor, col = gray((1:length(xCoor))/(length(xCoor)+1)), lty = 3)

returnedSeeds = snowflakes(xCoor = xCoor, yCoor = yCoor, radius = radius, orientation = orientation, seeds = 1:3, color = gray((1:length(xCoor))/(length(xCoor)+1)), anotherColor = "gray")

## ---- echo=TRUE----------------------------------------------------------

fancySnowflakes = function(xCoor, yCoor, radius, seeds, orientation = pi/6){
  colorCoord = as.hexmode(col2rgb("blue"))
  transpBlue =paste("#", paste(colorCoord, collapse=""), "44", sep="")
  colorCoord = as.hexmode(col2rgb("white"))
  transpWhite =paste("#", paste(colorCoord, collapse=""), "66", sep="")
  for (i in 1:length(xCoor)){
    snowflakes(xCoor = xCoor[i], yCoor = yCoor[i], radius = radius, color = transpBlue, anotherColor = "#33333333", seeds = seeds[i])
    snowflakes(xCoor = xCoor[i], yCoor = yCoor[i], radius = radius, color = transpWhite, anotherColor = transpWhite, seeds = seeds[i])
  }
}

## ---- echo=TRUE, fig.show='hold', fig.height = 7, fig.width = 7, fig.cap = "Cool looking snowflakes."----

numSnowflPerRow = 5
set.seed(2018)
selectSeeds = sample(1:100000, numSnowflPerRow^2)
xCoor = rep(1:numSnowflPerRow, numSnowflPerRow)
yCoor = rep(1:numSnowflPerRow, each = numSnowflPerRow)
radius = .4


par(mar = c(0, 0, 0, 0))
plot(range(xCoor)+c(-1, 1)*.5, range(yCoor)+c(-1, 1)*.5, type="n", axes = FALSE, ylab="", xlab="")
selectSeeds = c(90068, 46258, 41165, 66142, 4636, 37906, 17295, 9250, 30595, 74555, 12669, 62970, 96997, 43447, 81975, 23841, 73197, 8419, 14318, 83885, 29343, 47445, 66721, 29854, 77912)

fancySnowflakes(xCoor = xCoor, yCoor = yCoor, radius = radius, seeds = selectSeeds)
text(xCoor, yCoor, selectSeeds, cex=.5, pos = 3)


