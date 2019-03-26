library(R2ucare)


### Name: ungroup_data
### Title: Ungroup encounter capture-recapture data in individual histories
### Aliases: ungroup_data
### Keywords: package

### ** Examples

# Generate fake capture-recapture dataset
X = matrix(round(runif(9)),nrow=3)
freq=c(4,3,-8)
cbind(X,freq)
ungroup_data(X,freq)



