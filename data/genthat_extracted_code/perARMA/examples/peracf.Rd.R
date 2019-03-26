library(perARMA)


### Name: peracf
### Title: Periodic ACF function
### Aliases: peracf
### Keywords: peracf

### ** Examples

data(volumes)
dev.set(which=1)
peracf(t(volumes),24,seq(1,12),NaN,'volumes')



