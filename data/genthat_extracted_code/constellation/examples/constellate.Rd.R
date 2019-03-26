library(constellation)


### Name: constellate
### Title: Identify when a constellation of events occur
### Aliases: constellate

### ** Examples

library(data.table)
temp <- as.data.table(vitals[VARIABLE == "TEMPERATURE"])
pulse <- as.data.table(vitals[VARIABLE == "PULSE"])
resp <- as.data.table(vitals[VARIABLE == "RESPIRATORY_RATE"])
wbc <- as.data.table(labs[VARIABLE == "WBC"])
temp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
pulse[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
resp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
wbc[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]

# Pass single time window for all time series data frames
# Subset first event
constellate(temp, pulse, resp, window_hours = 6, join_key = "PAT_ID",
 time_var = "RECORDED_TIME", event_name = "sirs_vitals", mult = "first")
# Pass different time window for each time series data frame
# Subset first event
constellate(temp, pulse, resp, wbc, window_hours = c(6,6,6,24),
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 event_name = "SEPSIS", mult = "first")
# Pass different time window for each time series data frame
# Identify all events
constellate(temp, pulse, resp, wbc, window_hours = c(6,6,6,24),
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 event_name = "SEPSIS", mult = "all")




