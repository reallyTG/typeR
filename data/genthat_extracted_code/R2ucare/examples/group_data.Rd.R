library(R2ucare)


### Name: group_data
### Title: Group individual capture-recapture data in encounter histories
### Aliases: group_data
### Keywords: package

### ** Examples

# Generate fake capture-recapture dataset
X = matrix(round(runif(300)),nrow=100)
freq=rep(1,100)
cbind(X,freq)
group_data(X,freq)



