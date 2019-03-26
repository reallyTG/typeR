library(constellation)


### Name: value_change
### Title: Identify changes in a value over time
### Aliases: value_change

### ** Examples

library(data.table)
systolic_bp <- as.data.table(vitals[VARIABLE == "SYSTOLIC_BP"])

systolic_bp[, RECORDED_TIME := as.POSIXct(RECORDED_TIME,
  format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")]

# Identify all instances of a drop of 40 over 6 hours
value_change(systolic_bp, value = 40, direction = "down", window_hours = 6,
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 value_var = "VALUE", mult = "all")
# Identify first instance of a drop of 40 over 6 hours
value_change(systolic_bp, value = 40, direction = "down", window_hours = 6,
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 value_var = "VALUE", mult = "first")
# Identify last instance of a drop of 40 over 6 hours
value_change(systolic_bp, value = 40, direction = "down", window_hours = 6,
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 value_var = "VALUE", mult = "last")
# Identify all instances of drops and increases of 40 over 6 hours
value_change(systolic_bp, value = 40, direction = "all", window_hours = 6,
 join_key = "PAT_ID", time_var = "RECORDED_TIME",
 value_var = "VALUE", mult = "all")




