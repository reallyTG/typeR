library(latticeExtra)


### Name: panel.quantile
### Title: Plot a quantile regression line with standard error bounds.
### Aliases: panel.quantile
### Keywords: dplot

### ** Examples

## library("quantreg")

set.seed(1)
xy <- data.frame(x = runif(100), y = rt(100, df = 5))
xyplot(y ~ x, xy) +
  layer(panel.quantile(x, y, tau = c(.95, .5, .05)))

if (require("splines")) {
  xyplot(y ~ x, xy) +
    layer(panel.quantile(y ~ ns(x, 3), tau = 0.9))

  xyplot(y ~ x, xy) +
    layer(panel.quantile(y ~ ns(x, 3), tau = 0.9, ci = TRUE))
}

xyplot(y ~ x, xy) +
  layer(panel.quantile(x, y, tau = c(.5, .9, .1), superpose = TRUE))
update(trellis.last.object(),
  auto.key = list(text = paste(c(50,90,10), "% quantile"),
                  points = FALSE, lines = TRUE))

## seems not to work...
#xyplot(y ~ x, xy) +
#  layer(panel.quantile(y ~ qss(x, lambda=1), method = "rqss"))



