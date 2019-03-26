library(TPmsm)


### Name: setPackageSeedTP
### Title: Set the initial package seed
### Aliases: setPackageSeedTP
### Keywords: environment utilities

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Define package seed
seed <- rep(x=1, times=6)

# Set package seed
setPackageSeedTP(seed)

# Create survTP object
data(heartTP)
heartTP_obj <- with(heartTP, survTP(time1, event1, Stime, event))

# Compute transition probabilities with confidence band
TPmsm0 <- transAJ(object=heartTP_obj, s=33, t=412, conf=TRUE,
conf.level=0.9, method.boot="percentile")

# Compute transition probabilities with confidence band
TPmsm1 <- transAJ(object=heartTP_obj, s=33, t=412, conf=TRUE,
conf.level=0.9, method.boot="percentile")

# The objects should be different
all.equal(TPmsm0, TPmsm1)

# Set package seed
setPackageSeedTP(seed)

# Compute transition probabilities with confidence band
TPmsm2 <- transAJ(object=heartTP_obj, s=33, t=412, conf=TRUE,
conf.level=0.9, method.boot="percentile")

# Both objects were computed from the same seed and should be equal
all.equal(TPmsm0, TPmsm2)

# Restore the number of threads
setThreadsTP(nth)



