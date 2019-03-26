library(hNMF)


### Name: initializeSPA
### Title: The successive projection algorithm, a useful method for
###   initializing the NMF source matrix
### Aliases: initializeSPA

### ** Examples


# random data
X <- matrix(runif(10*20), 10,20)

# Create initial source matrix for 3 sources
W0 <- initializeSPA(X,3)



