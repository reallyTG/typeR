library(ActisoftR)


### Name: deagg
### Title: Deaggregation of reports for summary_type sequential or daily.
### Aliases: deagg

### ** Examples

library("lubridate")
data("act")
par <- data.frame(subject_ID = 1,
                  summary_duration_h = 24,
                  summary_type = "sequential",
                  summary_start_datime = ymd_hms("2017-12-05 00:00:00 UTC"),
                  summary_end_datime = ymd_hms("2017-12-15 00:00:00 UTC"))
deagg(period = par)




