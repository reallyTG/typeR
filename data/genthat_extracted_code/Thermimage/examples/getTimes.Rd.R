library(Thermimage)


### Name: getTimes
### Title: Extracts time values as POSIX from binary imported thermal video
###   file
### Aliases: getTimes

### ** Examples


f<-system.file("extdata", "SampleSEQ.seq", package = "Thermimage")
x<-frameLocates(f)
getTimes(f, x$h.start)

# only returns the first frame of data, must use lapply to get all frames
# POSIX type data do not play well with lists, so try the following:

# Using lapply
extract.times<-do.call("c", lapply(x$h.start, getTimes, vidfile=f))
extract.times

# Using parallel lapply:
library(parallel)
# set mc.cores to higher number to use parallel processing:
extract.times<-do.call("c", mclapply(x$h.start, getTimes, vidfile=f, byte.length=2,
timestart=448, mc.cores=1))
extract.times




