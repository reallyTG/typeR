library(eChem)


### Name: plotDiffGrid
### Title: Plot Diffusion Grids
### Aliases: plotDiffGrid

### ** Examples

ex_cv = simulateCV(e.start = 0.25, e.switch = -0.25, e.form = 0,
  x.units = 100, t.units = 1000)
plotDiffGrid(ex_cv, species = c(TRUE, TRUE, FALSE),
  scale.factor = 0.5)



