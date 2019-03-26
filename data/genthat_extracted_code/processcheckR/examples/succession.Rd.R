library(processcheckR)


### Name: succession
### Title: Check succession between two activities
### Aliases: succession

### ** Examples

library(bupaR)
library(eventdataR)

# Blood test should always happen before a MRI Scan,
# and both should happen when one of them happens.
patients %>%
check_rule(succession("Blood test","MRI SCAN"))




