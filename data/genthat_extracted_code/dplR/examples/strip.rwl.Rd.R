library(dplR)


### Name: strip.rwl
### Title: Chronology Stripping by EPS
### Aliases: strip.rwl
### Keywords: manip

### ** Examples

library(utils)
data(anos1)
anos1.ids <- read.ids(anos1, stc = c(4, 3, 1))
srwl <- strip.rwl(anos1, ids = anos1.ids, verbose = TRUE)
tail(srwl)



