library(processcheckR)


### Name: responded_existence
### Title: Check for responded existence between two activity
### Aliases: responded_existence

### ** Examples

library(bupaR)
library(eventdataR)


# When a Blood test occurs, a MRI Scan should also have
# happened for this patient (before or after the test).

patients %>%
check_rule(responded_existence("Blood test","MRI SCAN"))




