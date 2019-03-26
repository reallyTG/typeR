library(eChem)


### Name: annotateCV
### Title: Annotate Cyclic Voltammogram
### Aliases: annotateCV

### ** Examples


cv_ex2 = simulateCV(ko = 0.01, e.switch = -0.8, e.form = -0.4,
  x.units = 100, t.units = 1000)
annotateCV(cv_ex2)



