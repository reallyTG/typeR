library(GCalcium)


### Name: find_peaks
### Title: Get peaks/valleys in waveform data
### Aliases: find_peaks

### ** Examples

### Format data frame
df.new <- format_data(GCaMP)

### How many peaks are there in trial 1 with 10 decreasing data points on each side?
peak.indices <- find_peaks(df.new$Trial1, n.points = 10)

### When do they occur?
data.frame(times = df.new$Time[peak.indices], vals = df.new$Trial1[peak.indices])



