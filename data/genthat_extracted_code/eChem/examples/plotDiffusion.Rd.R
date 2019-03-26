library(eChem)


### Name: plotDiffusion
### Title: Plot Diffusion Profiles
### Aliases: plotDiffusion

### ** Examples


ex_cv = simulateCV(e.start = 0.25, e.switch = -0.25, e.form = 0,
  x.units = 100, t.units = 1000)
plotDiffusion(ex_cv, t = 0.5)

ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
plotDiffusion(ex_ca, t = 21)



