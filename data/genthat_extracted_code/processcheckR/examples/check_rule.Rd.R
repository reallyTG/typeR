library(processcheckR)


### Name: check_rule
### Title: Check declarative rules.
### Aliases: check_rule

### ** Examples

library(bupaR)
library(eventdataR)

# check whether MRI Scan is preceded by Blood test.
patients %>%
check_rule(precedence("Blood test","MRI SCAN"))




