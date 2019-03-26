library(processcheckR)


### Name: xor
### Title: Check for exclusiveness of two activities
### Aliases: xor

### ** Examples

library(bupaR)
library(eventdataR)

# A patient should not receive both an X-Ray and MRI Scan
patients %>%
check_rule(xor("X-Ray","MRI SCAN"))



