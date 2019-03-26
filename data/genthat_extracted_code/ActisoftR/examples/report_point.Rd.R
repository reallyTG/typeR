library(ActisoftR)


### Name: report_point
### Title: Generates reports based on input points.
### Aliases: report_point

### ** Examples

# Example 1
library(lubridate)
par_point <- data.frame(subject_ID = c(1,1),
                       time_point_datime = ymd_hms(c("2017-12-06 00:00:00 UTC",
                       "2017-12-07 00:00:00 UTC")))
report_point(period = par_point, acti_data = act)



