library(dlnm)


### Name: exphist
### Title: Define Exposure Histories from an Exposure Profile
### Aliases: exphist
### Keywords: smooth

### ** Examples

### an exposure history evaluated at a single time
(exp <- sample(1:10))
exphist(exp, 5, 3)
exphist(exp, 5, 12)
exphist(exp, 15, 3)

### use of argument lag
exphist(exp, 15, c(3,7))

### exposure histories evaluated at multiple times
exphist(exp, 3:5, 12)
exphist(exp, lag=12)

### fill with NA's
exphist(exp, lag=12, fill=NA)

### see the vignette dlnmExtended for further examples



