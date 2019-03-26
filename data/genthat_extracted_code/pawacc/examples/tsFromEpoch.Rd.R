library(pawacc)


### Name: tsFromEpoch
### Title: Calculate timestamp from epoch number or epoch number from
###   timestamp
### Aliases: tsFromEpoch epochFromTS
### Keywords: timestamp Actigraph GT1M Actigraph GT3X

### ** Examples

data(gt1m_sample)

tsFromEpoch(gt1m_sample, 10000)
# [1] "2011-12-10 01:39:45 GMT"

epochFromTS(gt1m_sample, as.POSIXlt(strptime('2011-12-10 01:39:45', '%Y-%m-%d %H:%M:%S')))
# [1] 10000



