library(latticeExtra)


### Name: as.layer
### Title: Overlay panels of Trellis plots on same or different scales
### Aliases: as.layer as.layer.layer as.layer.trellis
### Keywords: aplot

### ** Examples

b1 <- barley
b2 <- barley
b2$yield <- b2$yield + 10

## panels are matched up by packet number
dotplot(variety ~ yield | site * year, b1) +
  as.layer(dotplot(variety ~ yield | site * year, b2, col = "red"))

## which gives the same result as:
dotplot(variety ~ yield | site * year, data = b1, subscripts = TRUE) +
  layer(panel.dotplot(yield[subscripts], variety[subscripts], col = "red"),
        data = b2)


## example with all same scales (the default):
xyplot(fdeaths ~ mdeaths) +
  as.layer(xyplot(fdeaths ~ mdeaths, col = 2, subset = ldeaths > 2000))

## same x scales, different y scales:
xyplot(fdeaths ~ mdeaths) +
  as.layer(bwplot(~ mdeaths, box.ratio = 0.2), y.same = FALSE)

## same y scales, different x scales:
xyplot(fdeaths ~ mdeaths) +
  as.layer(bwplot(fdeaths ~ factor(mdeaths*0), box.ratio = 0.2), x.same = FALSE)

## as.layer() is called automatically if two plots are added:
histogram(~ ldeaths, type = "density") + densityplot(~ ldeaths, lwd = 3)

## applying one panel layer to several panels of another object
xyplot(Sepal.Length + Sepal.Width ~ Petal.Length + Petal.Width | Species,
       data = iris, scales = "free") +
   as.layer(levelplot(volcano), x.same = FALSE, y.same = FALSE, under = TRUE)



