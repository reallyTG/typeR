library(metafor)


### Name: bldiag
### Title: Construct Block Diagonal Matrix
### Aliases: bldiag
### Keywords: manip

### ** Examples

### load data
dat <- get(data(dat.berkey1998))

### construct list of the variance-covariance matrices of the observed outcomes for the studies
V <- lapply(split(dat[,c("v1i", "v2i")], dat$trial), as.matrix)

### construct block diagonal matrix
V <- bldiag(V)
V



