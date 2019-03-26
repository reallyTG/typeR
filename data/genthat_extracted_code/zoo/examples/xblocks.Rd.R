library(zoo)


### Name: xblocks
### Title: Plot contiguous blocks along x axis.
### Aliases: xblocks xblocks.default xblocks.zoo xblocks.ts
### Keywords: dplot

### ** Examples

## example time series:
set.seed(0)
flow <- ts(filter(rlnorm(200, mean = 1), 0.8, method = "r"))

## highlight values above and below thresholds.
## this draws on top using semi-transparent colors.
rgb <- hcl(c(0, 0, 260), c = c(100, 0, 100), l = c(50, 90, 50), alpha = 0.3)
plot(flow)
xblocks(flow > 30, col = rgb[1]) ## high values red
xblocks(flow < 15, col = rgb[3]) ## low value blue
xblocks(flow >= 15 & flow <= 30, col = rgb[2]) ## the rest gray

## same thing:
plot(flow)
xblocks(time(flow), cut(flow, c(0,15,30,Inf), labels = rev(rgb)))

## another approach is to plot blocks underneath without transparency.
plot(flow)
## note that 'ifelse' keeps its result as class 'ts'
xblocks(ifelse(flow < mean(flow), hcl(0, 0, 90), hcl(0, 80, 70)))
## need to redraw data series on top:
lines(flow)
box()

## for single series only: plot.default has a panel.first argument
plot(time(flow), flow, type = "l",
  panel.first = xblocks(flow > 20, col = "lightgray"))
## (see also the 'panel' argument for use with multiple series, below)

## insert some missing values
flow[c(1:10, 50:80, 100)] <- NA

## the default plot shows data coverage
## (most useful when displaying multiple series, see below)
plot(flow)
xblocks(flow)

## can also show gaps:
plot(flow, type = "s")
xblocks(time(flow), is.na(flow), col = "gray")

## Example of alternating colors, here showing calendar months
flowdates <- as.Date("2000-01-01") + as.numeric(time(flow))
flowz <- zoo(coredata(flow), flowdates)
plot(flowz)
xblocks(flowz, months, ## i.e. months(time(flowz)),
  col = gray.colors(2, start = 0.7), border = "slategray")
lines(flowz)

## Example of multiple series.
## set up example data
z <- ts(cbind(A = 0:5, B = c(6:7, NA, NA, 10:11), C = c(NA, 13:17)))

## show data coverage only (highlighting gaps)
plot(z, panel = function(x, ...)
  xblocks(x, col = "darkgray"))

## draw gaps in darkgray
plot(z, type = "s", panel = function(x, ...) {
  xblocks(time(x), is.na(x), col = "darkgray")
  lines(x, ...); points(x)
})

## Example of overlaying blocks from a different series.
## Are US presidential approval ratings linked to sunspot activity?
## Set block height to plot blocks along the bottom.
plot(presidents)
xblocks(sunspot.year > 50, height = 2)



