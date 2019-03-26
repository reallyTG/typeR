library(ff)


### Name: bigsample
### Title: Sampling from large pools
### Aliases: bigsample bigsample.default bigsample.ff
### Keywords: distribution data

### ** Examples

message("Specify pool size")
bigsample(1e8, 10)
message("Sample ff elements (same as x[bigsample(length(ff(1:100 / 10)), 10)])")
bigsample(ff(1:100 / 10), 10)
 ## Not run: 
##D    message("Speed factor")
##D      (system.time(for(i in 1:10)sample(1e8, 10))[3]/10) 
##D    / (system.time(for(i in 1:1000)bigsample(1e8, 10))[3]/1000)
##D  
## End(Not run)



