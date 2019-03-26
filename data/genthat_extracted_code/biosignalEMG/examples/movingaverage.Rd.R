library(biosignalEMG)


### Name: movingaverage
### Title: Moving average of an EMG
### Aliases: movingaverage
### Keywords: manip

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Simulate 5 seconds of an EMG
emgx <- syntheticemg(n.length.out = 5000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
plot(emgx, main = "Synthetic EMG")

# Compute the moving average of the rectified EMG
emgr <- rectification(emgx, rtype = "fullwave")
emgma <- movingaverage(emgr, wsize = 30, units = "samples")
plot(emgma, main = "Moving average of the rectified EMG")

# reset graphical parameters
par(op)



