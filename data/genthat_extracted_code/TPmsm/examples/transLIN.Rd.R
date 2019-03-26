library(TPmsm)


### Name: transLIN
### Title: LIN based transition probabilities
### Aliases: transLIN
### Keywords: dplot multivariate nonparametric smooth survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object with age as covariate
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event, age=age))

# Compute unconditioned transition probabilities
transLIN(object=heartTP_obj, s=33, t=412)

# Compute unconditioned transition probabilities with confidence band
transLIN(object=heartTP_obj, s=33, t=412, conf=TRUE, conf.level=0.9,
method.boot="basic")

# Compute conditional transition probabilities
transLIN(object=heartTP_obj, s=33, t=412, x=0)

# Compute conditional transition probabilities with confidence band
transLIN(object=heartTP_obj, s=33, t=412, x=0, conf=TRUE, conf.level=0.95,
n.boot=100, method.boot="percentile")

# Restore the number of threads
setThreadsTP(nth)



