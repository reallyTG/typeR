library(processcheckR)


### Name: and
### Title: Check for co-existence of two activities
### Aliases: and

### ** Examples

library(bupaR)
library(eventdataR)

# Check that if a patients is registered, he's also checked-out, and vice versa.
patients %>%
check_rule(and("Registration","Check-out"))




