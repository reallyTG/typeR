library(sdcMicro)


### Name: selectHouseholdData
### Title: Creates a household level file from a dataset with a household
###   structure.
### Aliases: selectHouseholdData

### ** Examples

## ori-hid: household-ids; household_weights: sampling weights for households
x_hh <- selectHouseholdData(dat=testdata, hhId="ori_hid",
  hhVars=c("urbrur", "roof",  "walls", "water", "electcon", "household_weights"))



