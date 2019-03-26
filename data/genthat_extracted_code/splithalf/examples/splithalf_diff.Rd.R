library(splithalf)


### Name: splithalf_diff
### Title: Split Half for difference scores
### Aliases: splithalf_diff

### ** Examples

## split half estimates for the bias index in two blocks
## using 50 iterations of the random split method (note: 5000 would be standard)
# not run:
# splithalf_diff(DPdata, conditionlist = c("block1","block2"),
# halftype = "random", no.iterations = 50)
## In datasets with missing data an additional output is generated
## the console will return a list of participants/blocks
## the output will also include a full dataframe of missing values
# not run:
# splithalf_diff(DPdata_missing, conditionlist = c("block1","block2"),
# halftype = "random", no.iterations = 50)



