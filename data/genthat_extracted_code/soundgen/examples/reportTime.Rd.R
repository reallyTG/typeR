library(soundgen)


### Name: reportTime
### Title: Report time
### Aliases: reportTime
### Keywords: internal

### ** Examples

time_start = proc.time()
for (i in 1:20) {
  Sys.sleep(i ^ 2 / 10000)
  soundgen:::reportTime(i = i, nIter = 20, time_start = time_start,
  jobs = (1:20) ^ 2, reportEvery = 5)
}



