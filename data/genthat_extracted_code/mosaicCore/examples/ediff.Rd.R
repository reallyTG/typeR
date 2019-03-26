library(mosaicCore)


### Name: ediff
### Title: Lagged Differences with equal length
### Aliases: ediff

### ** Examples

ediff(1:10)
ediff(1:10, pad.value = 0)
ediff(1:10, 2)
ediff(1:10, 2, 2)
x <- cumsum(cumsum(1:10))
ediff(x, lag = 2)
ediff(x, differences = 2)
ediff(x, differences = 2, pad = "symmetric")
ediff(.leap.seconds)
if (require(mosaic)) {
  Men <- subset(SwimRecords, sex == "M")
  Men <- mutate(Men, change = ediff(time), interval = ediff(year))
  head(Men)
}



