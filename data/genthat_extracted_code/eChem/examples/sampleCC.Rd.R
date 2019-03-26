library(eChem)


### Name: sampleCC
### Title: Create Subsample of a Simulated Chronocoulogram
### Aliases: sampleCC

### ** Examples

ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
ex_cc = simulateCC(ex_ca)
ex_ccsample = sampleCC(ex_cc, data.reduction = 5)
str(ex_ccsample)



