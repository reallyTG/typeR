library(eChem)


### Name: annotateLSV
### Title: Annotate Linear Sweep Voltammogram
### Aliases: annotateLSV

### ** Examples

ex_lsv = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "fast", x.units = 100, t.units = 1000)
annotateLSV(ex_lsv)



