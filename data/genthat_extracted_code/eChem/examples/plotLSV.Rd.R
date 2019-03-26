library(eChem)


### Name: plotLSV
### Title: Plot Linear Sweep Voltammograms
### Aliases: plotLSV

### ** Examples


lsv_ex1 = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "fast", x.units = 100, t.units = 1000)
lsv_ex2 = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "medium", x.units = 100, t.units = 1000)
lsv_ex3 = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "slow", x.units = 100, t.units = 1000)
lsv_ex4 = simulateLSV(e.start = 0.25, e.end = -0.25, e.form = 0,
  stir.rate = "off", x.units = 100, t.units = 1000)
plotLSV(filenames = list(lsv_ex1, lsv_ex2, lsv_ex3, lsv_ex4),
  legend_text = c("stir rate: fast", "stir rate: medium",
  "stir rate: slow", "stir rate: off"))



