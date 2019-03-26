library(INDperform)


### Name: ind_init
### Title: Initialization of indicator-pressure models
### Aliases: ind_init

### ** Examples

# Using the Baltic Sea demo data in this package
press_tbl <- press_ex[ ,-1] # excl. Year
ind_tbl <- ind_ex[ ,-1] # excl. Year
time <- ind_ex[ ,1]
# Assign randomly 50% of the observations as training data and
# the other 50% as test data
ind_init(ind_tbl, press_tbl, time, train = 0.5, random = TRUE)
# To keep the name when testing only one indicator and pressure, coerce both vectors
# data frames
ind_init(ind_tbl = data.frame(MS = ind_tbl$MS), press_tbl = data.frame(Tsum = press_tbl$Tsum),
 time, train = .5, random = TRUE)



