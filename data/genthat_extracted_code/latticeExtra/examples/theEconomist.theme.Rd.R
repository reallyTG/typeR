library(latticeExtra)


### Name: theEconomist.theme
### Title: Generate plots with style like The Economist.
### Aliases: theEconomist.theme theEconomist.opts theEconomist.axis
###   asTheEconomist
### Keywords: dplot

### ** Examples

xyplot(window(sunspot.year, start = 1900),
  main = "Sunspot cycles", sub = "Number per year",
  par.settings = theEconomist.theme(box = "transparent"),
  lattice.options = theEconomist.opts())

asTheEconomist(xyplot(window(sunspot.year, start = 1900),
  main = "Sunspot cycles", sub = "Number per year"))

trellis.last.object() +
  layer_(panel.xblocks(x, x >= 1980, col = "#6CCFF6", alpha = .5)) +
  layer(panel.text(1988, 180, "Forecast", font = 3, pos = 2))

## set as defaults -- remember to set back when finished.
opar <- trellis.par.get()
trellis.par.set(theEconomist.theme(box = "transparent"))
oopt <- lattice.options(theEconomist.opts())

barchart(Titanic[,,,"No"], main = "Titanic deaths", layout = 1:2,
    sub = "by sex and class", auto.key = list(columns = 2),
    scales = list(y = list(alternating = 2)))

asTheEconomist(
  dotplot(VADeaths, main = "Death Rates in Virginia (1940)",
    auto.key = list(corner = c(.9,0.1))),
  type = "b", with.bg = TRUE)

dotplot(VADeaths, auto.key = TRUE, type = "b",
  par.settings = theEconomist.theme(with.bg = TRUE))

asTheEconomist(
  densityplot(~ height, groups = voice.part, data = singer,
    subset = grep("1", voice.part), plot.points = FALSE)) +
glayer(d <- density(x), i <- which.max(d$y),
  ltext(d$x[i], d$y[i], paste("Group", group.number), pos = 3))

## reset
trellis.par.set(opar)
lattice.options(oopt)



