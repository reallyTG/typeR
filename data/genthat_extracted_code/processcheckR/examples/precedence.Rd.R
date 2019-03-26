library(processcheckR)


### Name: precedence
### Title: Check for precedence between two activities.
### Aliases: precedence

### ** Examples

library(bupaR)
library(eventdataR)


# A MRI Scan should be preceeded by a Blood test.

patients %>%
check_rule(precedence("Blood test","MRI SCAN"))




