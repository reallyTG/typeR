library(ClimProjDiags)


### Name: DailyAno
### Title: Daily anomalies
### Aliases: DailyAno

### ** Examples

# Time series in a vector example:
data <- 1:10
jdays <- c(rep(1, 5), rep(2, 5))
daily_anomaly <- DailyAno(data = data, jdays = jdays, na.rm = TRUE)
print(daily_anomaly)



