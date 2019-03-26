library(TPmsm)


### Name: transAJ
### Title: Aalen-Johansen transition probabilities
### Aliases: transAJ
### Keywords: dplot nonparametric survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event))

# Compute transition probabilities
transAJ(object=heartTP_obj, s=33, t=412)

# Compute transition probabilities with confidence band
transAJ(object=heartTP_obj, s=33, t=412, conf=TRUE, conf.level=0.9,
method.boot="percentile")

# Restore the number of threads
setThreadsTP(nth)



