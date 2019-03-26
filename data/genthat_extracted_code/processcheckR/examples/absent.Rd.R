library(processcheckR)


### Name: absent
### Title: Check if an activity is absent from a case
### Aliases: absent

### ** Examples

library(bupaR)
library(eventdataR)

# Check for which patients the activity "MRI SCAN" is absent.
patients %>%
check_rule(absent("MRI SCAN"))

# Check for which patients the activity "Blood test"
# occurs maximum a single time, but not 2 times or more.
patients %>%
check_rule(absent("Blood test", n = 2))





