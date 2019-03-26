library(biosignalEMG)


### Name: biosignalEMG-package
### Title: Tools for Electromyogram Signals (EMG) Analysis
### Aliases: biosignalEMG-package biosignalEMG
### Keywords: package

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 2))

# Simulate 5 seconds of an EMG
emgx <- syntheticemg(n.length.out = 5000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
plot(emgx, main = "Synthetic EMG")

# Full-wave rectified EMG
emgr <- rectification(emgx, rtype = "fullwave")
plot(emgr, main = "Rectified EMG")

# Integration of the full-wave rectified EMG with reset points every
# 200 samples
emgi <- integration(emgr, reset = TRUE, reset.criteria = "samples", vreset = 200)
plot(emgi, main = "Integrated EMG")

# MA-envelope
emgma <- envelope(emgx, method = "MA", wsize = 60)
# Ensemble-averaged EMG
ea <- eaemg(emgma, runs = emgx$on.off, what = 1, timenormalization = "mean", 
    scalem = 1, empirical = TRUE, level = 0.9)
plot(ea, lwd = 2, main = "Ensemble-averaged EMG")

# reset graphical parameters
par(op)



