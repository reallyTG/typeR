library(CompRandFld)


### Name: Covmatrix
### Title: Spatio-temporal (tapered) Covariance Matrix
### Aliases: Covmatrix
### Keywords: Simulation

### ** Examples

library(CompRandFld)
library(spam)

################################################################
###
### Example 1. Covariance matrix associated to
### a Matern correlation model
###
###############################################################

# Define the spatial-coordinates of the points:
x <- runif(500, 0, 2)
y <- runif(500, 0, 2)

matrix1 <- Covmatrix(x, y, corrmodel="matern", param=list(smooth=0.5,
                    sill=1,scale=0.2,mean=0))
dim(matrix1$covmatrix)



################################################################
###
### Example 3. Covariance matrix associated to
### a space-time double exponential correlation model
###
###############################################################

# Define the temporal-coordinates:
times <- c(1,2,3)

# Define correlation model
corrmodel="exp_exp"

# Define covariance parameters
param=list(scale_s=0.3,scale_t=0.5,sill=1,mean=0)

# Simulation of a spatial Gaussian random field:
matrix3 <- Covmatrix(x, y, times, corrmodel=corrmodel,
                     param=param)

dim(matrix3$covmatrix)

################################################################
###
### Example 2. Tapered Covariance matrix associated to
### a Matern correlation model
###
###############################################################

# Define the spatial-coordinates of the points:
#x <- runif(500, 0, 2)
#y <- runif(500, 0, 2)

#matrix2 <- Covmatrix(x, y, corrmodel="matern", param=list(smooth=0.5,
#                    sill=1,scale=0.2,mean=0),maxdist=0.3,taper="Wendland1",
#                    type="Tapering")
# Tapered covariance matrix
#as.matrix(matrix2$covmatrix)[1:15,1:15]

# Percentage of no zero values in the tapered matrix
#matrix2$nozero

################################################################
###
### Example 4. Tapered Covariance matrix associated to
### a space-time double exponential correlation model
###
###############################################################

#param <- list(scale_s=2,scale_t=1,sill=1,mean=0)
#matrix4 <- Covmatrix(x, y, times, corrmodel="exp_exp", param=param, maxdist=0.3,
#                     maxtime=2,taper="Wendland2_Wendland2",type="Tapering")

# Tapered space time covariance matrix
#as.matrix(matrix4$covmatrix)[1:10,1:10]

# Percentage of no zero values in the tapered matrix
#matrix4$nozero



