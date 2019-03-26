library(constellation)


### Name: constellate_criteria
### Title: Provide details about individual events within a constellation
### Aliases: constellate_criteria

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

# Pass single window_hours
constellate_criteria(temp, pulse, resp, criteria_names = c("TEMPERATURE",
 "PULSE", "RESPIRATORY_RATE"), window_hours = 6, join_key = "PAT_ID",
 time_var = "RECORDED_TIME", value = "time")
# Pass vector for window_hours
constellate_criteria(temp, pulse, resp, criteria_names = c("TEMPERATURE",
 "PULSE", "RESPIRATORY_RATE"), window_hours = c(6,6,6), join_key = "PAT_ID",
 time_var = "RECORDED_TIME", value = "time")
# Show the value of each criteria at the time the event occurs
constellate_criteria(temp, pulse, resp, criteria_names = c("TEMPERATURE",
 "PULSE", "RESPIRATORY_RATE"), window_hours = c(6,6,6), join_key =
 "PAT_ID", time_var = "RECORDED_TIME", value = "result",
 result_var = "VALUE")




