library(vetr)


### Name: all_bw
### Title: Verify Values in Vector are Between Two Others
### Aliases: all_bw

### ** Examples

all_bw(runif(100), 0, 1)
all_bw(runif(100) * 2, 0, 1)
all_bw(NA, 0, 1)              # This is does not return NA
all_bw(NA, 0, 1, na.rm=TRUE)

vec <- c(runif(100, 0, 1e12), Inf, 0)
all_bw(vec, 0)      # All +ve numbers
all_bw(vec, hi=0)   # All -ve numbers
all_bw(vec, 0, bounds="(]") # All strictly +ve nums
all_bw(vec, 0, bounds="[)") # All finite +ve nums



