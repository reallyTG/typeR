library(qcc)


### Name: qcc.groups
### Title: Grouping data based on a sample indicator
### Aliases: qcc.groups
### Keywords: manip

### ** Examples

data(pistonrings)
attach(pistonrings)
# 40 sample of 5 obs each
qcc.groups(diameter, sample)
# some obs are removed, the result is still a 40x5 matrix but with NAs added
qcc.groups(diameter[-c(1,2,50,52, 199)], sample[-c(1,2,50,52, 199)])



