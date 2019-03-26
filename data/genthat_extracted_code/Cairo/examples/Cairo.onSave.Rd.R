library(Cairo)


### Name: Cairo.onSave
### Title: Cairo callbacks
### Aliases: Cairo.onSave
### Keywords: device

### ** Examples

if (require(png, quietly=TRUE)) {
  dev <- Cairo(800, 600, type='raster')
  Cairo.onSave(dev, function(dev, page)
    .GlobalEnv$png <- writePNG(Cairo.capture(dev))
  )
  plot(1:10, col=2)
  dev.off()
  str(png)
}



