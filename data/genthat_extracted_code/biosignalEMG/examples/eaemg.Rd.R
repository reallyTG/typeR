library(biosignalEMG)


### Name: eaemg
### Title: Ensemble-averaged EMG
### Aliases: eaemg plot.eaemg print.eaemg summary.eaemg
### Keywords: graphs

### ** Examples

# change graphical parameters to show multiple plots
op <- par(mfrow = c(2, 1))

# Simulate 10 seconds of an EMG
emgx <- syntheticemg(n.length.out = 10000, on.sd = 1, on.duration.mean = 350, 
    on.duration.sd = 10, off.sd = 0.05, off.duration.mean = 300, off.duration.sd = 20, 
    on.mode.pos = 0.75, shape.factor = 0.5, samplingrate = 1000, units = "mV", 
    data.name = "Synthetic EMG")
# MA-envelope
emgma <- envelope(emgx, method = "MA", wsize = 60)
# Ensemble-averaged EMG
ea1 <- eaemg(emgma, runs = rle(emgx$on.off), what = 1, timenormalization = "max", 
    scalem = 1, empirical = TRUE, level = 0.9)
plot(ea1, lwd = 2, main = "Ensemble-averaged EMG using apriori onset/offset")

# Determine the onset/offset runs using a thresholded envelope
empiricalonoff <- onoff_singlethres(emgx, t = 0.05)
ea2 <- eaemg(emgma, runs = empiricalonoff, what = 1, timenormalization = "max", 
    scalem = 1, empirical = TRUE, level = 0.9)
plot(ea2, lwd = 2, main = "Ensemble-averaged EMG using empirical onset/offset")

# reset graphical parameters
par(op)



