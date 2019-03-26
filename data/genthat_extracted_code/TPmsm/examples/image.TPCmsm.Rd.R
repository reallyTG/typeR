library(TPmsm)


### Name: image.TPCmsm
### Title: image method for a TPCmsm object
### Aliases: image.TPCmsm
### Keywords: hplot methods multivariate survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(heartTP)
heartTP_obj <- with( heartTP, survTP(time1, event1, Stime, event, age=age) )

# Compute LIN conditional transition probabilities with confidence band
TPCmsm_obj <- transLIN(heartTP_obj, s=57, t=310, x=0, conf=TRUE, n.boot=100,
method.boot="basic")

# Plot image with Time in the x-axis
image(TPCmsm_obj, image.type="tc", tr.choice=c("1 1", "1 2", "2 2"), conf.int=TRUE,
ylab="Age")

# Plot image with Time in the y-axis
image(TPCmsm_obj, image.type="ct", tr.choice=c("1 1", "1 2", "1 3"), conf.int=TRUE,
xlab="Age")

# Restore the number of threads
setThreadsTP(nth)



