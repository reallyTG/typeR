library(bandit)


### Name: deseasonalized_trend
### Title: deseasonalized_trend
### Aliases: deseasonalized_trend
### Keywords: htest

### ** Examples

timestamps = as.numeric(as.POSIXct(seq(as.Date("2012-01-01"),as.Date("2012-05-03"),by=1)))
df=data.frame(timestamp = timestamps, value = rnorm(length(timestamps)))
dt = deseasonalized_trend(df)
if (dt$pval < 0.01) {
  print("Significant time-based factor")
  plot(df$timestamp, dt$smoothed_prediction)
} else {
  print("No significant time-based factor")
}

df=data.frame(timestamp = timestamps,
              value = sapply(timestamps, function(t) {rpois(1, lambda=t-min(timestamps))}))
dt = deseasonalized_trend(df)
if (dt$pval < 0.01) {
  print("Significant time-based factor")
  plot(df$timestamp, dt$smoothed_prediction)
} else {
  print("No significant time-based factor")
}




