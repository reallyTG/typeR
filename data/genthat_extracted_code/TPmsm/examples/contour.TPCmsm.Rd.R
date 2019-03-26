library(TPmsm)


### Name: contour.TPCmsm
### Title: contour method for a TPCmsm object
### Aliases: contour.TPCmsm
### Keywords: aplot hplot methods multivariate survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(colonTP)
colonTP_obj <- with( colonTP, survTP(time1, event1, Stime, event, age=age) )

# Compute IPCW conditional transition probabilities without confidence band
TPCmsm_obj <- transIPCW(colonTP_obj, s=57, t=310, x=0)

# Plot contour with Time in the x-axis
contour(TPCmsm_obj, contour.type="tc", tr.choice=c("1 1", "1 2", "2 2"), ylab="Age")

# Plot contour with Time in the y-axis
contour(TPCmsm_obj, contour.type="ct", tr.choice=c("1 1", "1 2", "1 3"), xlab="Age")

# Restore the number of threads
setThreadsTP(nth)



