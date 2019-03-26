library(constellation)


### Name: bundle
### Title: Identify bundle items that occur around a given event
### Aliases: bundle

### ** Examples

library(data.table)
temp <- as.data.table(vitals[VARIABLE == "TEMPERATURE"])
pulse <- as.data.table(vitals[VARIABLE == "PULSE"])
resp <- as.data.table(vitals[VARIABLE == "RESPIRATORY_RATE"])

temp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
pulse[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]
resp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]

# Pass single window_hours_pre
# All instances of bundle items within time window of event
bundle(temp, pulse, resp,
    bundle_names = c("PLATELETS", "INR"), window_hours_pre = 24,
    window_hours_post = c(6, 6), join_key = "PAT_ID",
    time_var = "RECORDED_TIME", event_name = "CREATININE", mult = "all")
# Pass different window_hours_pre for each bundle time series data frame
# All instances of bundle items within time window of event
bundle(temp, pulse, resp,
    bundle_names = c("PLATELETS", "INR"), window_hours_pre = c(24, 12),
    window_hours_post = c(6, 6), join_key = "PAT_ID",
    time_var = "RECORDED_TIME", event_name = "CREATININE", mult = "all")
# Pass different window_hours_pre for each bundle time series data frame
# First instance of each bundle item within time window of event
bundle(temp, pulse, resp,
    bundle_names = c("PLATELETS", "INR"), window_hours_pre = c(24, 12),
    window_hours_post = c(6, 6), join_key = "PAT_ID",
    time_var = "RECORDED_TIME", event_name = "CREATININE", mult = "first")
# Pass different window_hours_pre for each bundle time series data frame
# Last instance of each bundle item within time window of event
bundle(temp, pulse, resp,
    bundle_names = c("PLATELETS", "INR"), window_hours_pre = c(24, 12),
    window_hours_post = c(6, 6), join_key = "PAT_ID",
    time_var = "RECORDED_TIME", event_name = "CREATININE", mult = "last")




