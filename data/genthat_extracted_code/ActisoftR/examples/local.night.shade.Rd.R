library(ActisoftR)


### Name: local.night.shade
### Title: Generates local night time periods
### Aliases: local.night.shade

### ** Examples

library("dplyr")
library("lubridate")
data(act)
# Selecting the date/time arrival to Amsterdam for subject_ID 1
start_date <- act[act$subject_ID==1 & act$interval_type == "FLIGHT" &
act$comments == "SIN-AMS",]$datime_end
sel <- act[act$datime_start >= start_date & act$datime_end <= start_date + lubridate::days(10),]
localTZ <- data.frame(subject_ID = "1",
                      TZ = "Europe/Amsterdam", stringsAsFactors = FALSE)
local.night.shade(sel, shadow.start = "20:00:00",
                  shadow.end = "06:00:00", localTZ = localTZ)





