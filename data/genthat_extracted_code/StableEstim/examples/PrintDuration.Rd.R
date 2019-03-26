library(StableEstim)


### Name: PrintDuration
### Title: print duration
### Aliases: PrintDuration
### Keywords: general-functions

### ** Examples

ti=getTime_()
for (i in 1:100) x=i*22.1
tf=getTime_()
duration=ComputeDuration(ti,tf)
PrintDuration(duration, "test")



