library(eChem)


### Name: sampleCA
### Title: Create Subsample of a Simulated Chronoamperogram
### Aliases: sampleCA

### ** Examples

ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
ex_casample = sampleCA(ex_ca, data.reduction = 5)
str(ex_casample)



