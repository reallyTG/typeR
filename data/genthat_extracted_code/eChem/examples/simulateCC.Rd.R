library(eChem)


### Name: simulateCC
### Title: Simulate a Chronocoulometry Experiment
### Aliases: simulateCC

### ** Examples

ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
ex_cc = simulateCC(ex_ca)
str(ex_cc)



