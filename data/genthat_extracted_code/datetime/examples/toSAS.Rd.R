library(datetime)


### Name: toSAS.datetime
### Title: Convert Timepoint to SAS Format
### Aliases: toSAS.datetime toSAS.date toSAS.time
### Keywords: manip

### ** Examples

if(require(SASxport)) toSAS(as.datetime('1960-01-01T00:00')) # 0
if(require(SASxport)) toSAS(as.date('1960-01-02')) # 1
if(require(SASxport)) toSAS(as.time('00:01')) # 60




