library(CompRandFld)


### Name: FitComposite
### Title: Max-Likelihood-Based Fitting of Gaussian, Binary and Max-Stable
###   Fields
### Aliases: FitComposite print.FitComposite
### Keywords: Composite

### ** Examples

library(CompRandFld)
library(RandomFields)
library(spam)
set.seed(3132)

###############################################################
############ Examples of spatial random fields ################
###############################################################

# Define the spatial-coordinates of the points:
x <- runif(100, 0, 10)
y <- runif(100, 0, 10)

# Set the covariance model's parameters:
corrmodel <- "exponential"
mean <- 0
sill <- 1
nugget <- 0
scale <- 1.5
param<-list(mean=mean,sill=sill,nugget=nugget,scale=scale)
coords<-cbind(x,y)
# Simulation of the spatial Gaussian random field:
data <- RFsim(coordx=coords, corrmodel=corrmodel, param=param)$data

# Fixed parameters
fixed<-list(mean=mean,nugget=nugget)

# Starting value for the estimated parameters
start<-list(scale=scale,sill=sill)


################################################################
###
### Example 1. Maximum likelihood fitting of
### Gaussian random fields with exponential correlation.
### One spatial replication.
### Likelihood setting: composite with
### marginal pairwise likelihood objects.
###
###############################################################


# Maximum composite-likelihood fitting of the random field:
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel, maxdist=2,
                    likelihood="Marginal",type="Pairwise",varest=TRUE,
                    start=start,fixed=fixed)

# Results:
print(fit)

################################################################
###
### Example 2. Maximum likelihood fitting of
### Gaussian random fields with exponential correlation.
### One spatial replication.
### Likelihood setting: standard full likelihood.
###
###############################################################

# Maximum composite-likelihood fitting of the random field:
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel,likelihood="Full",
                    type="Standard",varest=TRUE,start=start,fixed=fixed)
# Results:
print(fit)

################################################################
###
### Example 3. Maximum likelihood fitting of
### Gaussian random fields with exponetial correlation.
### One spatial replication.
### Likelihood setting: tapered full likelihood.
###
###############################################################

# Maximum tapered likelihood fitting of the random field:
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel,likelihood="Full",
                    type="Tapering",taper="Wendland1",maxdist=1.5,
                    varest=TRUE,start=start,fixed=fixed)

# Results:
print(fit)


################################################################
###
### Example 4. Maximum composite-likelihood fitting of
### max-stable random fields. Extremal Gaussian model with
### exponential correlation. n iid spatial replications.
### Likelihood setting: composite with marginal pairwise
### likelihood objects.
###
###############################################################

# Simulation of a max-stable random field in the specified points:
data <- RFsim(x, y, corrmodel=corrmodel, model="ExtGauss", replicates=30,
              param=list(mean=mean,sill=sill,nugget=nugget,scale=scale))$data

# Maximum composite-likelihood fitting of the random field:
fit <- FitComposite(data, x, y, corrmodel=corrmodel, model="ExtGauss",
                    replicates=30, varest=TRUE, vartype="Sampling",
                    margins="Frechet",start=list(sill=sill,scale=scale))

# Results:
print(fit)

################################################################
###
### Example 5. Maximum likelihood fitting of
### Binary-Gaussian random fields with exponential correlation.
### One spatial replication.
### Likelihood setting: composite with marginal pairwise
### likelihood objects.
###
###############################################################

#set.seed(3128)

#x <- runif(200, 0, 10)
#y <- runif(200, 0, 10)

# Simulation of the spatial Binary-Gaussian random field:
#data <- RFsim(coordx=coords, corrmodel=corrmodel, model="BinaryGauss",
#              threshold=0, param=list(mean=mean,sill=.8,
#              nugget=nugget,scale=scale))$data

# Maximum composite-likelihood fitting of the random field:
#fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel, threshold=0,
#                    model="BinaryGauss", fixed=list(nugget=nugget,
#                    mean=0),start=list(scale=.1,sill=.1))

# Results:
#print(fit)


###############################################################
######### Examples of spatio-temporal random fields ###########
###############################################################

# Define the temporal sequence:
#time <- seq(1, 80, 1)

# Define the spatial-coordinates of the points:
#x <- runif(10, 0, 10)
#y <- runif(10, 0, 10)
#coords=cbind(x,y)

# Set the covariance model's parameters:
#corrmodel="exp_exp"
#scale_s=0.5
#scale_t=1
#sill=1
#nugget=0
#mean=0

#param<-list(mean=0,scale_s=1,scale_t=1,sill=sill,nugget=nugget)

# Simulation of the spatial-temporal Gaussian random field:
#data <- RFsim(coordx=coords,coordt=time,corrmodel=corrmodel,
#              param=param)$data

# Fixed parameters
#fixed<-list(mean=mean,nugget=nugget)

# Starting value for the estimated parameters
#start<-list(scale_s=scale_s,scale_t=scale_t,sill=sill)

################################################################
###
### Example 6. Maximum likelihood fitting of
### Gaussian random field with double-exponential correlation.
### One spatio-temporal replication.
### Likelihood setting: composite with conditional pairwise
### likelihood objects.
###
###############################################################

# Maximum composite-likelihood fitting of the random field:
#fit <- FitComposite(data=data,coordx=coords,coordt=time,corrmodel="exp_exp",
#                    maxtime=2,maxdist=1,likelihood="Marginal",type="Pairwise",
#                    start=start,fixed=fixed)

# Results:
#print(fit)




