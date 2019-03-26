library(zoo)


### Name: ggplot2.zoo
### Title: Convenience Functions for Plotting zoo Objects with ggplot2
### Aliases: autoplot.zoo fortify.zoo ggplot2.zoo facet_free yearmon_trans
###   yearqtr_trans scale_x_yearmon scale_y_yearmon scale_x_yearqtr
###   scale_y_yearqtr

### ** Examples

if(require("ggplot2") && require("scales")) {
## example data
x.Date <- as.Date(paste(2003, 02, c(1, 3, 7, 9, 14), sep = "-"))
x <- zoo(rnorm(5), x.Date)
xlow <- x - runif(5)
xhigh <- x + runif(5)
z <- cbind(x, xlow, xhigh)

## univariate plotting
autoplot(x)
## by hand
ggplot(aes(x = Index, y = Value), data = fortify(x, melt = TRUE)) +
  geom_line() + xlab("Index") + ylab("x")
## adding series one at a time
last_plot() + geom_line(aes(x = Index, y = xlow), colour = "red", data = fortify(xlow))
## add ribbon for high/low band
ggplot(aes(x = Index, y = x, ymin = xlow, ymax = xhigh), data = fortify(x)) +
  geom_ribbon(fill = "darkgray") + geom_line()

## multivariate plotting in multiple or single panels
autoplot(z)                      ## multiple without color/linetype
autoplot(z, facets = Series ~ .) ## multiple with series-dependent color/linetype
autoplot(z, facets = NULL)       ## single with series-dependent color/linetype
## by hand with color/linetype and with/without facets
qplot(x = Index, y = Value, group = Series, colour = Series,
  linetype = Series, facets = Series ~ ., data = fortify(z, melt = TRUE)) +
  geom_line() + xlab("Index") + ylab("")
ggplot(aes(x = Index, y = Value, group = Series, colour = Series, linetype = Series),
  data = fortify(z, melt = TRUE)) + geom_line() + xlab("Index") + ylab("")
## variations
autoplot(z, geom = "point")
autoplot(z, facets = NULL) + geom_point()
autoplot(z, facets = NULL) + scale_colour_grey() + theme_bw()

## for "ts" series via coercion
autoplot(as.zoo(EuStockMarkets))
autoplot(as.zoo(EuStockMarkets), facets = NULL)

autoplot(z) + 
	aes(colour = NULL, linetype = NULL) +
	facet_grid(Series ~ ., scales = "free_y")

autoplot(z) + aes(colour = NULL, linetype = NULL) + facet_free() # same

z.yq <- zooreg(rnorm(50), as.yearqtr("2000-1"), freq = 4)
autoplot(z.yq) + scale_x_yearqtr()

## mimic matplot
data <- cbind(A = c(6, 1, NA, NA), B = c(16, 4, 1, NA), C = c(25, 7, 2, 1))
autoplot(zoo(data), facet = NULL) + geom_point()
## with different line types
autoplot(zoo(data), facet = NULL) + geom_point() + aes(linetype = Series)

## illustrate just fortify() method
z <- zoo(data)
fortify(z)
fortify(z, melt = TRUE)
fortify(z, melt = TRUE, names = c("Time", NA, "Data"))
fortify(z, melt = TRUE, names = c(Index = "Time"))

## with/without splitting
z <- zoo(cbind(a.A = 1:2, a.B = 2:3, b.A = 3:4, c.B = 4:5))
fortify(z)
fortify(z, melt = TRUE, sep = ".",
  names = list(Series = c("Lower", "Upper")))

}



