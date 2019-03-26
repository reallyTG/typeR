library(biosignalEMG)


### Name: print.summary.eaemg
### Title: Shows the content of an 'eaemg' summary on the console
### Aliases: print.summary.eaemg
### Keywords: internal

### ** Examples

# Simulate 10 seconds of an EMG
emgx <- syntheticemg(n.length.out = 10000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
# MA-envelope
emgma <- envelope(emgx, method = "MA", wsize = 60)
# Ensemble-averaged EMG
ea <- eaemg(emgma, runs = rle(emgx$on.off), what = 1, timenormalization = "mean", 
    empirical = TRUE, level = 0.9)
summary(ea, lwd = 2)



