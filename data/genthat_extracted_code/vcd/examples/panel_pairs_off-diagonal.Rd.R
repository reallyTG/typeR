library(vcd)


### Name: Pairs plot panel functions for off-diagonal cells
### Title: Off-diagonal Panel Functions for Table Pairs Plot
### Aliases: pairs_strucplot pairs_mosaic pairs_assoc pairs_sieve
### Keywords: hplot

### ** Examples

data("UCBAdmissions")
data("PreSex")

pairs(PreSex)
pairs(UCBAdmissions)
pairs(UCBAdmissions, upper_panel_args = list(shade = FALSE))
pairs(UCBAdmissions, lower_panel = pairs_mosaic(type = "conditional"))
pairs(UCBAdmissions, upper_panel = pairs_assoc)



