library(ActisoftR)


### Name: csd
### Title: Cumulative sleep debt.
### Aliases: csd

### ** Examples

# Example 1
library(lubridate)
data(act)
act$datime_start <- ymd_hms(act$datime_start)
act$datime_end <- ymd_hms(act$datime_end)

par <- data.frame(subject_ID = 1,
summary_duration_h = 24,
summary_type = "sequential",
summary_start_datime = ymd_hms("2017-12-05 00:00:00 UTC"),
summary_end_datime = ymd_hms("2017-12-15 00:00:00 UTC"))

rep <- report_period(period = par , acti_data = act)

start_date <- act[act$subject_ID==1 & act$interval_type == "FLIGHT" &
act$comments == "SIN-AMS",]$datime_end
sel <- act[act$datime_start >= start_date & act$datime_end <=
start_date + days(10),]

par_afterflight <- data.frame(subject_ID = 1,
summary_duration_h = 24,
summary_type = "sequential",
summary_start_datime = round.POSIXt(start_date, "day"),
summary_end_datime = round.POSIXt(start_date, "day") + days(10))
rep_afterflight <- report_period(period = par_afterflight , acti_data = sel)
baseline <- data.frame(subject_ID = 1, baseline_sleep = mean(rep$total_sleep))
reset <- 2
z <- csd(x = rep_afterflight, baseline_sleep = baseline, reset = 2)
z[[2]]
plot(z[[1]])
# Example 2 with no reset by adding large reset value
csd(x = rep_afterflight, baseline_sleep = baseline, reset = 1E5)



