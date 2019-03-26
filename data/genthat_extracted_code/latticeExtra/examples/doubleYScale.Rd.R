library(latticeExtra)


### Name: doubleYScale
### Title: Draw two plot series with different y scales
### Aliases: doubleYScale
### Keywords: aplot

### ** Examples

set.seed(1)
foo <- list(x = 1:100, y = cumsum(rnorm(100)))
## show original data
xyplot(y + y^2 ~ x, foo, type = "l")
## construct separate plots for each series
obj1 <- xyplot(y ~ x, foo, type = "l")
obj2 <- xyplot(y^2 ~ x, foo, type = "l")
## simple case: no axis for the overlaid plot
doubleYScale(obj1, obj2, add.axis = FALSE)
## draw second y axis
doubleYScale(obj1, obj2)
## ...with second ylab
doubleYScale(obj1, obj2, add.ylab2 = TRUE)
## ...or with a key
doubleYScale(obj1, obj2, text = c("obj1", "obj2"))
## ...with custom styles
update(doubleYScale(obj1, obj2, text = c("obj1", "obj2")),
  par.settings = simpleTheme(col = c('red','black'), lty = 1:2))

## different plot types
x <- rnorm(60)
doubleYScale(histogram(x), densityplot(x), use.style = FALSE)
## (but see ?as.layer for a better way to do this)

## multi-panel example
## a variant of Figure 5.13 from Sarkar (2008)
## http://lmdvr.r-forge.r-project.org/figures/figures.html?chapter=05;figure=05_13
data(SeatacWeather)
temp <- xyplot(min.temp + max.temp ~ day | month,
               data = SeatacWeather, type = "l", layout = c(3, 1))
rain <- xyplot(precip ~ day | month, data = SeatacWeather, type = "h")

doubleYScale(temp, rain, style1 = 0, style2 = 3, add.ylab2 = TRUE,
   text = c("min. T", "max. T", "rain"), columns = 3)

## re-plot with different styles
update(trellis.last.object(),
   par.settings = simpleTheme(col = c("black", "red", "blue")))



