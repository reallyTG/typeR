library(biosignalEMG)


### Name: syntheticemg
### Title: Synthetic EMG
### Aliases: syntheticemg
### Keywords: datagen

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Simulate 10 seconds of an EMG
emg1 <- syntheticemg(n.length.out = 10000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
plot(emg1, main = "Synthetic EMG")

# Simulate 10 seconds of an EMG (pulse trains)
emg2 <- syntheticemg(n.length.out = 10000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.5, shape.factor = 0, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
plot(emg2, main = "Synthetic EMG (pulse trains)")

# reset graphical parameters
par(op)



