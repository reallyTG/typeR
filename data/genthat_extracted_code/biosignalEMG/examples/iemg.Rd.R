library(biosignalEMG)


### Name: iemg
### Title: Integrated EMG
### Aliases: iemg print.iemg plot.iemg summary.iemg print.summary.iemg
### Keywords: internal

### ** Examples

# Simulate 5 seconds of an EMG
emgx <- syntheticemg(n.length.out = 5000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")

# Full-wave rectified EMG
emgr <- rectification(emgx, rtype = "fullwave")

# Integration of the full-wave rectified EMG without reset points
emgi1 <- integration(emgr, reset = FALSE)
print(emgi1)
plot(emgi1, main = "Integrated EMG")
summary(emgi1)



