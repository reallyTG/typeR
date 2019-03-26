library(discharge)


### Name: fft_metrics
### Title: Discrete Fourier Transform Metrics
### Aliases: fft_metrics

### ** Examples

# load sample data
data("sycamore")
x = sycamore

# get streamflow object for the sample data
x.streamflow = asStreamflow(x)

# prepare baseline signal 
x.bl = prepareBaseline(x.streamflow)

# fetch the DFFT metrics for this sample data
# "candmax" chosen because preliminary analysis (e.g. with fourierAnalysis 
#           output) shows the signal is highest sometime between
#           day 190 and day 330
# "candmin" can be estimated analogously.
x.fftmetrics = fft_metrics(x, river.name = "Sycamore", candmin = c(40:125), 
                           candmax = c(190:330), baseline.signal = x.bl)




