library(crqa)


### Name: checkts
### Title: Check and trim time-series
### Aliases: checkts
### Keywords: misc

### ** Examples

## generate two time-series of different length

ts1 = seq(1,30,1); ts2 = seq(1,25,1)
datatype = "continuous"
threshold = 6 ## threshold is larger than difference
pad = FALSE

res = checkts(ts1, ts2, datatype, threshold, pad)
print(res)

threshold = 4 ## threshold is smaller than difference

res = checkts(ts1, ts2, datatype, threshold)
print(res)




