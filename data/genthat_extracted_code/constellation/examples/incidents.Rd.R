library(constellation)


### Name: incidents
### Title: Identify incident events separated by a minimum time window
### Aliases: incidents

### ** Examples

library(data.table)
systolic_bp <- as.data.table(vitals[VARIABLE == "SYSTOLIC_BP"])
systolic_bp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]

# Identify systolic blood pressure measurements for each patient that are
 # separated by at least 24 hours
incidents(systolic_bp, window_hours = 24, join_key = "PAT_ID",
 time_var = "RECORDED_TIME")

# Identify systolic blood pressure measurements that are separated by at
 # least 24 hours
incidents(systolic_bp, window_hours = 24, time_var = "RECORDED_TIME")




