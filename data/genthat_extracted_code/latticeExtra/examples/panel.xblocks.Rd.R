library(latticeExtra)


### Name: panel.xblocks
### Title: Plot contiguous blocks along x axis.
### Aliases: panel.xblocks panel.xblocks.default panel.xblocks.ts
###   panel.xblocks.zoo
### Keywords: dplot

### ** Examples

## Example of highlighting peaks in a time series.
set.seed(0)
flow <- ts(filter(rlnorm(200, mean = 1), 0.8, method = "r"))

## using an explicit panel function
xyplot(flow, panel = function(x, y, ...) {
  panel.xblocks(x, y > mean(y), col = "lightgray")
  panel.xyplot(x, y, ...)
})
## using layers; this is the `ts` method because `>` keeps it as ts.
xyplot(flow) +
  layer_(panel.xblocks(flow > mean(flow), col = "lightgray"))

## Example of alternating colors, here showing calendar months
flowdates <- as.Date("2000-01-01") + as.numeric(time(flow))
xyplot(flow ~ flowdates, type = "l") +
  layer_(panel.xblocks(x, months,
         col = c("lightgray", "#e6e6e6"), border = "darkgray"))

## highlight values above and below thresholds.
## blue, gray, red colors:
bgr <- hcl(c(0, 0, 260), c = c(100, 0, 100), l = c(90, 90, 90))
dflow <- cut(flow, c(0,15,30,Inf), labels = bgr)
xyplot(flow) + layer_(panel.xblocks(time(flow), dflow))

## Example of highlighting gaps (NAs) in time series.
## set up example data
z <- ts(cbind(A = 0:5, B = c(6:7, NA, NA, 10:11), C = c(NA, 13:17)))

## show data coverage only (highlighting gaps)
xyplot(z, panel = panel.xblocks,
       scales = list(y = list(draw = FALSE)))

## draw gaps in darkgray
xyplot(z, type = c("p","s")) +
  layer_(panel.xblocks(x, is.na(y), col = "darkgray"))

## Example of overlaying blocks from a different series.
## Are US presidential approval ratings linked to sunspot activity?
## Set block height, default justification is along the bottom.
xyplot(presidents) + layer(panel.xblocks(sunspot.year > 50, height = 2))



