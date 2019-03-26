library(TPmsm)


### Name: transIPCW
### Title: Inverse probability of censoring weighted transition
###   probabilities
### Aliases: transIPCW
### Keywords: dplot multivariate nonparametric smooth survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object with age as covariate
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event, age=age))

# Compute unconditioned transition probabilities
transIPCW(object=heartTP_obj, s=33, t=412)

# Compute unconditioned transition probabilities with confidence band
transIPCW(object=heartTP_obj, s=33, t=412, conf=TRUE, conf.level=0.9,
method.boot="basic", method.est=2)

# Compute conditional transition probabilities
transIPCW(object=heartTP_obj, s=33, t=412, x=0)

# Compute conditional transition probabilities with confidence band
transIPCW(object=heartTP_obj, s=33, t=412, x=0, conf=TRUE, conf.level=0.95,
n.boot=100, method.boot="percentile", method.est=2)

# Restore the number of threads
setThreadsTP(nth)



