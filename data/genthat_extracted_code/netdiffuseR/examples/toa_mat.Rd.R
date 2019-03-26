library(netdiffuseR)


### Name: toa_mat
### Title: Time of adoption matrix
### Aliases: toa_mat
### Keywords: manip

### ** Examples

# Random set of times of adoptions
times <- sample(c(NA, 2001:2005), 10, TRUE)

toa_mat(times)

# Now, suppose that we observe the graph from 2000 to 2006
toa_mat(times, t0=2000, t1=2006)




