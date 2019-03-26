library(R.devices)


### Name: capturePlot
### Title: Captures a plot such that it can be redrawn later/elsewhere
### Aliases: capturePlot
### Keywords: device

### ** Examples

if (getRversion() >= "3.3.0") {

g <- capturePlot({
  plot(1:10)
})

## Display
print(g)

## Display with a 2/3 height-to-width aspect ratio
toDefault(aspectRatio=2/3, { print(g) })

## Redraw to many output formats
devEval(c("png", "eps", "pdf"), aspectRatio=2/3, print(g))

} ## if (getRversion() >= "3.3.0")



