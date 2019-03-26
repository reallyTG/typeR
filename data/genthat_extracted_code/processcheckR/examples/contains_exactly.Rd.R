library(processcheckR)


### Name: contains_exactly
### Title: Check if activity is present (contained) in a case for exactly n
###   times
### Aliases: contains_exactly

### ** Examples

library(bupaR)
library(eventdataR)

# Each patient should have exactly one registration activity instance.

patients %>%
check_rule(contains_exactly("Registration", n = 1))




