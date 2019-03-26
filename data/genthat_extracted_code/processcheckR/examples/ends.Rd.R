library(processcheckR)


### Name: ends
### Title: Check if cases end with an activity.
### Aliases: ends

### ** Examples

library(bupaR)
library(eventdataR)


# A patient's last activity should be the Check-out
patients %>%
check_rule(ends("Check-out"))



