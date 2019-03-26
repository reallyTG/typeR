library(processcheckR)


### Name: contains
### Title: Check if activity is present (contained) in a case
### Aliases: contains

### ** Examples

library(bupaR)
library(eventdataR)

# Each patient should be registered at least once.
patients %>%
check_rule(contains("Registration"))

# Check whether some patients have received 2 or more blood tests.

patients %>%
check_rule(contains("Blood test", n = 2))




