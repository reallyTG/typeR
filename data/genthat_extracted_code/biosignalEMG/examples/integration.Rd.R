library(biosignalEMG)


### Name: integration
### Title: Integration of an EMG
### Aliases: integration
### Keywords: manip

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

# Integration of the full-wave rectified EMG without reset points
emgi1 <- integration(emgr, reset = FALSE)
plot(emgi1, main = "Integrated EMG (no reset)")

# Integration of the full-wave rectified EMG with reset points every
# 200 samples
emgi2 <- integration(emgr, reset = TRUE, reset.criteria = "samples", vreset = 200)
plot(emgi2, main = "Integrated EMG (with reset)")

# Integration of the full-wave rectified EMG with a reset point each
# time the value 200 is reached
emgi3 <- integration(emgr, reset = TRUE, reset.criteria = "value", vreset = 200)
plot(emgi3, main = "Integrated EMG (with reset)")

# reset graphical parameters
par(op)



