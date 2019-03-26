library(latticeExtra)


### Name: xyplot.stl
### Title: Display stl fits with Lattice
### Aliases: xyplot.stl
### Keywords: hplot ts

### ** Examples

## example from ?stl
xyplot(stl(log(co2), s.window=21),
       main = "STL decomposition of CO2 data")

## alternative display
data(biocAccess)
xyplot(stl(ts(biocAccess$counts[1:(24 * 30)], frequency = 24), "periodic"),
       strip.left = "strip.default")
resizePanels()

## two different spans
xyplot(stl(nottem, s.window = 4)) +
as.layer(xyplot(stl(nottem, s.window = "periodic")), style = 2)

## components superposed
xyplot(stl(nottem, s.window = 4), superpose=TRUE,
  screens = list(data = "trend", trend = "trend", "residuals"),
  strip.left = TRUE, layout = c(1,2))



