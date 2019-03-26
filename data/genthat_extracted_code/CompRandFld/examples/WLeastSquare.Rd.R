library(CompRandFld)


### Name: WLeastSquare
### Title: WLS of Gaussian and Max-Stable Random Fields
### Aliases: WLeastSquare print.WLS
### Keywords: LeastSquare

### ** Examples

library(CompRandFld)
library(RandomFields)
set.seed(2111)

# Set the coordinates of the sites:
x <- runif(100, 0, 10)
y <- runif(100, 0, 10)


################################################################
###
### Example 1. Least square fitting of a Gaussian random field
### with exponential correlation.
### One spatial replication is simulated.
### Unweighted version (all weights equals to 1).
###
###############################################################

# Set the model's parameters:
corrmodel <- "exponential"
mean <- 0
sill <- 1
nugget <- 0
scale <- 2

# Simulation of the Gaussian random field:
data <- RFsim(x, y, corrmodel=corrmodel, param=list(mean=mean,
              sill=sill, nugget=nugget, scale=scale))$data

fix<-list(nugget=0)
ini<-list(scale=scale,sill=sill)
# Least square fitting of the random field:
fit <- WLeastSquare(data, x, y, corrmodel=corrmodel,fixed=fix,start=ini)

# Results:
print(fit)


################################################################
###
### Example 2. Least square fitting of a max-stable random field
### (Extremal Gaussian model) with exponential correlation
### n iid spatial replications.
### Unweighted version (all weights equals to 1).
###
###############################################################


# Simulation of the max-stable random field:
data <- RFsim(x, y, corrmodel=corrmodel, model="ExtGauss",
              param=list(mean=mean, sill=sill, nugget=nugget,
              scale=scale), replicates=40)$data

# Least square fitting of the random field:
fit <- WLeastSquare(data, x, y, corrmodel=corrmodel, model="ExtGauss",
                    replicates=40)

# Results:
print(fit)

################################################################
###
### Example 3. Least square fitting of a spatio-temporal
### Gaussian random field with double exponential correlation.
### One replication is simulated.
### Weighted version (all weights equals to 1).
###
###############################################################

# Define the temporal sequence:
#time <- seq(1, 25, 1)

# Simulation of the Gaussian random field:
#data <- RFsim(x, y, time, corrmodel="exp_exp", param=list(mean=mean,
#             scale_s=scale,scale_t=1,sill=sill,nugget=nugget))$data

#fix<-list(nugget=nugget)
#ini<-list(scale_s=scale,scale_t=1,sill=1)
# Weighted least square estimation:
#fit <- WLeastSquare(data, x, y, time, corrmodel="exp_exp", maxdist=5,
#                    maxtime=5,fixed=fix,start=ini)

# Results
#print(fit)



