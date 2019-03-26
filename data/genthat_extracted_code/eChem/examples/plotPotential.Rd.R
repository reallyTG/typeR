library(eChem)


### Name: plotPotential
### Title: Plot Applied Potential
### Aliases: plotPotential

### ** Examples


ex_cv = simulateCV(e.start = 0.25, e.switch = -0.25, e.form = 0,
  x.units = 100, t.units = 1000)
plotPotential(ex_cv,
  main_title = "Applied Potential for a Cyclic Voltammetry Simulation")

ex_ca = simulateCA(e.start = 0.25, e.pulse = -0.25, e.form = 0,
  pulses = "double", t.2 = 20, x.units = 100, t.units = 1000)
plotPotential(ex_ca,
   main_title = "Applied Potential for a Chronoamperometry Simulation")



