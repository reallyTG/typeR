library(splithalf)


### Name: splithalf_ACC
### Title: Dot-Probe Split Half
### Aliases: splithalf_ACC

### ** Examples

## split half estimates for two blocks of the task
## using 50 iterations of the random split method (note: 5000 would be standard)
splithalf(DPdata, conditionlist = c("block1","block2"), halftype = "random",
no.iterations = 50)
## In datasets with missing data an additional output is generated
## the console will return a list of participants/blocks
## the output will also include a full dataframe of missing values
splithalf(DPdata_missing, conditionlist = c("block1","block2"),
halftype = "random", no.iterations = 50)



