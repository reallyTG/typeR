library(processcheckR)


### Name: contains_between
### Title: Check if activity is present (contained) in a case between min
###   and max number of times
### Aliases: contains_between

### ** Examples

library(bupaR)
library(eventdataR)


# A patients should have between 0 and 4 blood tests (including 0 and 4).
patients %>%
check_rule(contains_between("Blood test", min = 0, max = 4))




