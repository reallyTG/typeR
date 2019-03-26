library(eChem)


### Name: sampleCV
### Title: Create Subsample of a Simulated Cyclic Voltammogram
### Aliases: sampleCV

### ** Examples

ex_cv = simulateCV(e.start = 0.25, e.switch = -0.25, e.form = 0,
  x.units = 100, t.units = 1000)
ex_cvsample = sampleCV(ex_cv, data.reduction = 5)
str(ex_cvsample)



