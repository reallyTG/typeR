library(measuRing)


### Name: crossRings
### Title: dplR crossdating
### Aliases: crossRings

### ** Examples

## Paths to three image sections in the package:
img <- system.file(c("P105_a.tif",
                     "P105_b.tif",
                     "P105_d.tif"),
                   package="measuRing")

## Recursive detection:
mrings <- multiDetect(img,
                      last.yr = 2013,
                      auto.det = TRUE,
                      plot = FALSE)

## corr analysis
crossRings(mrings,
           fun = 'corr',
           seg.length = 10,
           bin.floor = 0,
           lag.max = 2,
           make.plot = FALSE)



