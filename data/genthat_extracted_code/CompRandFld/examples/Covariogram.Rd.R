library(CompRandFld)


### Name: Covariogram
### Title: Computes covariance, variogram and extremal coefficient
###   functions
### Aliases: Covariogram
### Keywords: Composite

### ** Examples

library(CompRandFld)
library(RandomFields)
library(scatterplot3d)
set.seed(31231)

# Set the coordinates of the points:
x <- runif(100, 0, 10)
y <- runif(100, 0, 10)
coords<-cbind(x,y)

################################################################
###
### Example 1. Plot of covariance and variogram functions
### estimated from a Gaussian random field with exponent 
### correlation. One spatial replication is simulated.
###
###
###############################################################

# Set the model's parameters:
corrmodel <- "exponential"
mean <- 0
sill <- 1
nugget <- 0
scale <- 2

# Simulation of the Gaussian random field:
data <- RFsim(coordx=coords, corrmodel=corrmodel, param=list(mean=mean,
              sill=sill, nugget=nugget, scale=scale))$data

# Maximum composite-likelihood fitting of the Gaussian random field:

start<-list(scale=scale,sill=sill,mean=mean(data))
fixed<-list(nugget=nugget)
# Maximum composite-likelihood fitting of the random field:
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel,likelihood="Marginal",
                     type="Pairwise",start=start,fixed=fixed,maxdist=6)

# Results:
print(fit)

# Empirical estimation of the variogram:
vario <- EVariogram(data, x, y)

# Plot of covariance and variogram functions:
par(mfrow=c(1,2))
Covariogram(fit, show.cov=TRUE, show.range=TRUE,
            show.vario=TRUE, vario=vario,pch=20)


################################################################
##
### Example 2. Plot of covariance and extremal coefficient
### functions estimated from a max-stable random field with
### exponential correlation. n idd spatial replications are
### simulated.
###
###############################################################

set.seed(1156)
# Simulation of the max-stable random field:
data <- RFsim(coordx=coords, corrmodel=corrmodel, model="ExtGauss", replicates=20,
              param=list(mean=mean,sill=sill,nugget=nugget,scale=scale))$data

start=list(sill=sill,scale=scale)
# Maximum composite-likelihood fitting of the max-stable random field:
fit <- FitComposite(data, coordx=coords, corrmodel=corrmodel, model='ExtGauss',
                    replicates=20, varest=TRUE, vartype='Sampling',
                    margins="Frechet",start=start)

data <- Dist2Dist(data, to='sGumbel')

# Empirical estimation of the madogram:
vario <- EVariogram(data, coordx=coords, type='madogram', replicates=20)

# Plot of correlation and extremal coefficient functions:
par(mfrow=c(1,2))
Covariogram(fit, show.cov=TRUE, show.range=TRUE, show.extc=TRUE,
            vario=vario, pract.range=84,pch=20)


################################################################
###
### Example 3. Plot of covariance and variogram functions
### estimated from a Gaussian spatio-temporal random field with
### double-exp correlation.
### One spatio-temporal replication is simulated.
###
###############################################################

# Define the spatial-coordinates of the points:
#x <- runif(20, 0, 1)
#y <- runif(20, 0, 1)
# Define the temporal sequence:
#time <- seq(0, 30, 1)

# Simulation of the spatio-temporal Gaussian random field:
#data <- RFsim(x, y, time, corrmodel="exp_exp",param=list(mean=mean,
#              nugget=nugget,scale_s=0.5,scale_t=1,sill=sill))$data

# Maximum composite-likelihood fitting of the space-time Gaussian random field:
#fit <- FitComposite(data, x, y, time, corrmodel="exp_exp", maxtime=5,
#                    likelihood="Marginal",type="Pairwise", fixed=list(
#                    nugget=nugget, mean=mean),start=list(scale_s=0.2,
#                    scale_t=1, sill=sill))

# Empirical estimation of spatio-temporal covariance:
#vario <- EVariogram(data, x, y, time, maxtime=10)

# Plot of the fitted space-time covariace
#Covariogram(fit,show.cov=TRUE)

# Plot of the fitted space-time variogram
#Covariogram(fit,vario=vario,show.vario=TRUE)

# Plot of covariance, variogram and spatio and temporal profiles:
#Covariogram(fit,vario=vario,fix.lagt=1,fix.lags=1,show.vario=TRUE,pch=20)

################################################################
###
### Example 4. Plot of parametric and empirical lorelograms
### estimated from a Binary Gaussian random fields with 
### exponential correlation. One spatial replication is
### simulated.
###
###############################################################

#set.seed(1240)

# Define the spatial-coordinates of the points:
#x <- seq(0,3, 0.1)
#y <- seq(0,3, 0.1)

# Simulation of the Binary Gaussian random field:
#data <- RFsim(x, y, corrmodel=corrmodel, model="BinaryGauss",
#              threshold=0,param=list(nugget=nugget,mean=mean,
#              scale=.6,sill=0.8))$data

# Maximum composite-likelihood fitting of the Binary Gaussian random field:
#fit <- FitComposite(data, x, y, corrmodel=corrmodel, model="BinaryGauss",
#                    maxdist=0.8, likelihood="Marginal", type="Pairwise",
#                    start=list(mean=mean,scale=0.1,sill=0.1))

# Empirical estimation of the lorelogram:
#vario <- EVariogram(data, x, y, type="lorelogram", maxdist=2)

# Plot of fitted and empirical lorelograms:
#Covariogram(fit, vario=vario, show.vario=TRUE, lags=seq(0.1,2,0.1),pch=20)



