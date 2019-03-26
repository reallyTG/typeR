library(processcheckR)


### Name: starts
### Title: Check if cases start with an activity
### Aliases: starts

### ** Examples

library(bupaR)
library(eventdataR)

# Each patients should first be registered.
patients %>%
check_rule(starts("Registration"))




