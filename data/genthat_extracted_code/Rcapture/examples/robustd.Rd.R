library(Rcapture)


### Name: robustd
### Title: Loglinear Models for Capture-Recapture Experiments Carried Out
###   According to a Robust Design
### Aliases: robustd robustd.t robustd.0 print.robustd
### Keywords: models

### ** Examples

data(mvole)

  # The mvole data set contains a total of 30 capture occasions (the 
  # tenth capture occasion doesn't have any new capture and is taken
  # out of the analysis). This number being large, we can only use 
  # the robustd.0 function to fit a robust design model.

  # Not run :
# robustd.0(mvole[, -10], vt = c(5, 4, rep(5, 4)), vm = "Mh", vh = "Poisson", vtheta = 1.5)
  # Should take a few seconds to run.

  # Not run: 
# robustd.t(mvole[, -10], vt = c(5, 4, rep(5, 4)), vm = 'Mh', vh = 'Poisson', vtheta = 1.5)
  # Should fail.

  # Considering only the first 3 periods of the data set, we can use the 
  # robustd.t function to fit a model with a temporal effect.
robustd.t(mvole[, c(1:9, 11:15)], vt = c(5, 4, 5), vm = "Mth", vh = "Poisson", vtheta = 1.5)



