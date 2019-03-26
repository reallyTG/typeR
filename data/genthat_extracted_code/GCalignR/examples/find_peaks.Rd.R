library(GCalignR)


### Name: find_peaks
### Title: Detect local maxima in time series
### Aliases: find_peaks

### ** Examples

## create df
df <- data.frame(x = 1:1000, y = dnorm(1:1000,300,20))
## plot
with(df, plot(x,y))
## detect peak
find_peaks(df)




