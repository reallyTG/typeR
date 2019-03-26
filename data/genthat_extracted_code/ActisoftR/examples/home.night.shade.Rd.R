library(ActisoftR)


### Name: home.night.shade
### Title: Generates home night time periods
### Aliases: home.night.shade

### ** Examples

library("dplyr")
library("lubridate")
data(act)
dat <- act %>% group_by(subject_ID) %>%
mutate(start = min(datime_start)) %>%
ungroup %>% filter(datime_start <= start + lubridate::days(5),
subject_ID == 1, interval_type != "ACTIVE")
homeTZ = data.frame(subject_ID = "1",
TZ = "Pacific/Auckland", stringsAsFactors = FALSE)
home.night.shade(dat, shadow.start = "20:00:00", shadow.end = "06:00:00",
homeTZ = homeTZ)



