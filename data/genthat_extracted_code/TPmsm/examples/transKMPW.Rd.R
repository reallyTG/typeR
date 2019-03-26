library(TPmsm)


### Name: transKMPW
### Title: Presmoothed Kaplan-Meier weighted transition probabilities
### Aliases: transKMPW
### Keywords: dplot models regression survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event))

# Compute transition probabilities
transKMPW(object=heartTP_obj, s=33, t=412)

# Compute transition probabilities with confidence band
transKMPW(object=heartTP_obj, s=33, t=412, conf=TRUE, conf.level=0.9,
method.boot="percentile", method.est=4)

# Restore the number of threads
setThreadsTP(nth)



