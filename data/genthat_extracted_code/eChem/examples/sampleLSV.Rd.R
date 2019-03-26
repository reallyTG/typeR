library(eChem)


### Name: sampleLSV
### Title: Create Subsample of a Simulated Linear Sweep Voltammogram
### Aliases: sampleLSV

### ** Examples

ex_lsv = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "fast", x.units = 100, t.units = 1000)
ex_lsvsample = sampleLSV(ex_lsv, data.reduction = 5)
str(ex_lsvsample)



