library(chipPCR)


### Name: CD74
### Title: Quantitative PCR with a hydrolysis probe and DNA binding dye
### Aliases: CD74
### Keywords: datasets

### ** Examples

# First example
# Comparison of smoothers and filter on amplification curves
# Amplification curves were measured at three temperature (30, 
# 59.5, 68.5 degrees Celsius) using the VideoScan HCU (see 
# Roediger et al. 2013 for details). MLC-2v was amplified.
# The change of fluorescence was monitored by the intercalating
# dye EvaGreen and hydrolysis probes.

data(CD74)
par(mfrow = c(1,2))
plot(NA, NA, xlim = c(1,30), ylim = c(0,2), xlab = "Cycle", 
     ylab = "MFI", main = "VideoScan HCU\nRaw Data")
lim <- 1:30
for (j in c(2:4)) {
  for (i in seq(j,19,6)) {
    lines(CD74[lim, 1], CD74[lim, i], col = 1) 
  }
}
for (j in c(5:7)) {
  for (i in seq(j,19,6)) {
    lines(CD74[lim, 1], CD74[lim, i], col = 2) 
  }
}

plot(NA, NA, xlim = c(1,30), ylim = c(0,1.8), xlab = "Cycle", 
     ylab = "MFI", main = "VideoScan HCU\nSmoothed Data")
lim <- 1:30
for (j in c(2:4)) {
  for (i in seq(j,19,6)) {
    lines(CD74[lim, 1], smoother(CD74[lim, 1], CD74[lim, i], trans = TRUE), 
	  col = 1) 
  }
}
for (j in c(5:7)) {
  for (i in seq(j,19,6)) {
    lines(CD74[lim, 1], smoother(CD74[lim, 1], CD74[lim, i], trans = TRUE), 
	  col = 2) 
  }
}
par(mfrow = c(1,1))



