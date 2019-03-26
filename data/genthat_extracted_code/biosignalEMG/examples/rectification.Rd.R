library(biosignalEMG)


### Name: rectification
### Title: Full-wave and half-wave rectification of an EMG
### Aliases: rectification
### Keywords: manip

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(3, 1))

# Simulate 5 seconds of an EMG
emgx <- syntheticemg(n.length.out = 5000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
plot(emgx, main = "Synthetic EMG")

# Full-wave rectified EMG
emgr1 <- rectification(emgx, rtype = "fullwave")
plot(emgr1, main = "Full-wave rectified EMG")

# Half-wave rectified EMG
emgr2 <- rectification(emgx, rtype = "halfwave")
plot(emgr2, main = "Half-wave rectified EMG")

# reset graphical parameters
par(op)



