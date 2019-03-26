library(ActisoftR)


### Name: report_period
### Title: Generates reports based on input periods.
### Aliases: report_period

### ** Examples

# Example 1
library("lubridate")
data("act")
par <- data.frame(subject_ID = 1,
summary_duration_h = 24,
summary_type = "sequential",
summary_start_datime = ymd_hms("2017-12-05 00:00:00 UTC"),
summary_end_datime = ymd_hms("2017-12-15 00:00:00 UTC"))
report_period(period = par , acti_data = act)



