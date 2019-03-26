library(ActisoftR)


### Name: plot_Darwent
### Title: Plots participants' SLEEP/WAKE intervals.
### Aliases: plot_Darwent

### ** Examples

library("dplyr")
library("lubridate")
data(act)
dat <- act %>% group_by(subject_ID) %>%
  mutate(start = min(datime_start)) %>%
  ungroup %>% filter(datime_start <= start + days(10), interval_type != "ACTIVE")
plot_Darwent(dat,  acolor = c("#D55E00", "black", "#56B4E9"),
                  tz2 = "Pacific/Auckland",
                  si = c(4, 3, 2.5))

# Adding the 'home' night shade
# creating a data frame with the home time zone of the individuals
homeTZ = data.frame(subject_ID = unique(dat$subject_ID),
                    TZ = rep("Pacific/Auckland", 5),
                    stringsAsFactors = FALSE)
plot_Darwent(dat, acolor = c("#D55E00", "black", "#56B4E9"),
             si = c(4, 3, 2.5),
             tz = "UTC", tz2 = "Pacific/Auckland", shade = TRUE,
             homeTZ = homeTZ)





