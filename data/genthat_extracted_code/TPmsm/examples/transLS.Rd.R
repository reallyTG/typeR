library(TPmsm)


### Name: transLS
### Title: Location-Scale transition probabilities
### Aliases: transLS
### Keywords: dplot nonparametric smooth survival

### ** Examples

# Set the number of threads
nth <- setThreadsTP(2)

# Create survTP object
data(bladderTP)
bladderTP_obj <- with(bladderTP, survTP(time1, event1, Stime, event))

# Compute transition probabilities
LS0 <- transLS(object=bladderTP_obj, s=5, t=59, h=c(0.25, 2.5), nh=25, ncv=50, conf=FALSE)
print(LS0)

# Compute transition probabilities with confidence band
h <- with( LS0, c( rep(h[1], 2), rep(h[2], 2) ) )
transLS(object=bladderTP_obj, s=5, t=59, h=h, conf=TRUE,
conf.level=0.95, method.boot="percentile", boot.cv=FALSE)

# Restore the number of threads
setThreadsTP(nth)



