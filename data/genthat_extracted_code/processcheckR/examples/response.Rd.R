library(processcheckR)


### Name: response
### Title: Check for response between two activities
### Aliases: response

### ** Examples

library(bupaR)
library(eventdataR)

# A blood test should eventually be followed by Discuss Results

patients %>%
check_rule(response("Blood test","Discuss Results"))




