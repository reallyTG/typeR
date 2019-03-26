library(ipw)


### Name: tstartfun
### Title: Compute Starting Time For Counting Process Notation
### Aliases: tstartfun
### Keywords: methods survival

### ** Examples

#data
mydata1 <- data.frame(
   patient = c(1, 1, 1, 1, 1, 1, 2, 2, 2, 2),
   time.days = c(14, 34, 41, 56, 72, 98, 0, 11, 28, 35))

#compute starting time for each interval
mydata1$tstart <- tstartfun(patient, time.days, mydata1)

#result
mydata1

#see also ?ipwtm for example



