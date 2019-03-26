library(RSEIS)


### Name: fixNA
### Title: Fix NA values.
### Aliases: fixNA
### Keywords: misc

### ** Examples


## source("~/Site/TA_DATA/CODE/fixNA.R")

### last samples are NA
zig = rnorm(25)
zig[10:15] = NA

noNA = fixNA(zig)

### first samples are NA
zig = rnorm(25)
zig[1:5] = NA
noNA = fixNA(zig)


zig = rnorm(25)
zig[1:5] = NA
zig[21:25] = NA

noNA = fixNA(zig)



zig = rnorm(25)
zig[1] = NA
zig[21:25] = NA
zig[10:12] = NA

noNA = fixNA(zig)
cbind(zig, noNA)







