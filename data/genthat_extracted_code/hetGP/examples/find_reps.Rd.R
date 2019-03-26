library(hetGP)


### Name: find_reps
### Title: Data preprocessing
### Aliases: find_reps

### ** Examples

##------------------------------------------------------------
## Find replicates on the motorcycle data
##------------------------------------------------------------
## motorcycle data
library(MASS)
X <- matrix(mcycle$times, ncol = 1)
Z <- mcycle$accel

data_m <- find_reps(X, Z)

# Initial data
plot(X, Z, ylim = c(-160, 90), ylab = 'acceleration', xlab = "time")
# Display mean values
points(data_m$X0, data_m$Z0, pch = 20)



