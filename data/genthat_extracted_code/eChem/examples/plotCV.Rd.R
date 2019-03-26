library(eChem)


### Name: plotCV
### Title: Plot Cyclic Voltammograms
### Aliases: plotCV

### ** Examples


cv_ex1 = simulateCV(ko = 1, e.switch = -0.8, e.form = -0.4,
   x.units = 100, t.units = 1000)
cv_ex2 = simulateCV(ko = 0.01, e.switch = -0.8, e.form = -0.4,
  x.units = 100, t.units = 1000)
cv_ex3 = simulateCV(ko = 0.001, e.switch = -0.8, e.form = -0.4,
  x.units = 100, t.units = 1000)
cv_ex4 = simulateCV(ko = 0.0001, e.switch = -0.8, e.form = -0.4,
  x.units = 100, t.units = 1000)
plotCV(filenames = list(cv_ex1, cv_ex2, cv_ex3, cv_ex4),
  legend_text = c("ko = 1 cm/s", "ko = 0.01 cm/s",
  "ko = 0.001 cm/s", "ko = 0.0001 cm/s"))

cv_ex1sample = sampleCV(cv_ex1, data.reduction = 5)
plotCV(filenames = list(cv_ex1, cv_ex1sample),
  line_colors = c("blue", "red"))



