library(biosignalEMG)


### Name: envelope
### Title: RMS or MA Envelope of an EMG
### Aliases: envelope
### Keywords: manip

### ** Examples

# Simulate 5 seconds of an EMG
emgx <- syntheticemg(n.length.out = 5000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")

# MA-envelope
emgma <- envelope(emgx, method = "MA", wsize = 60)
# Superimpose the envelope on the EMG
plot(emgx, main = "MA-envelope")
plot(emgma, add = TRUE, lwd = 4, col = "red")

# RMS-envelope
emgrms <- envelope(emgx, method = "RMS", wsize = 60)
# Superimpose the envelope on the EMG
plot(emgx, main = "RMS-envelope")
plot(emgrms, add = TRUE, lwd = 4, col = "red")

# RMS-envelope
emgle <- envelope(emgx, method = "LE", cutoff = 10) #10Hz
# Superimpose the envelope on the EMG
plot(emgx, main = "LE-envelope")
plot(emgle, add = TRUE, lwd = 4, col = "red")




