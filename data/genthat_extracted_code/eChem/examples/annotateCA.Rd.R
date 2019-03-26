library(eChem)


### Name: annotateCA
### Title: Annotate Chronoamperogram
### Aliases: annotateCA

### ** Examples


ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
annotateCA(ex_ca, time.delay = 0.5)



