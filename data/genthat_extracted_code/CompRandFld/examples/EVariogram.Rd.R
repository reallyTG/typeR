library(CompRandFld)


### Name: EVariogram
### Title: Empirical Variogram(variants) of Gaussian, Binary and Max-Stable
###   Fields
### Aliases: EVariogram
### Keywords: Variogram

### ** Examples

library(CompRandFld)
library(RandomFields)
set.seed(514)

# Set the coordinates of the sites:
x <- runif(150, 0, 10)
y <- runif(150, 0, 10)


################################################################
###
### Example 1. Empirical estimation of the variogram from a
### Gaussian random field with exponential correlation.
### One spatial replication is simulated.
###
###
###############################################################

# Set the model's parameters:
corrmodel <- "exponential"
mean <- 0
sill <- 1
nugget <- 0
scale <- 3

# Simulation of the spatial Gaussian random field:
data <- RFsim(x, y, corrmodel=corrmodel, param=list(mean=mean,
              sill=sill, nugget=nugget, scale=scale))$data

# Empirical spatial variogram estimation:
fit <- EVariogram(data, x, y)

# Results:
plot(fit$centers, fit$variograms, xlab='h', ylab=expression(gamma(h)),
     ylim=c(0, max(fit$variograms)), xlim=c(0, fit$srange[2]), pch=20,
     main="variogram")


################################################################
###
### Example 2. Empirical estimation of the variogram from a
### spatio-temporal Gaussian random fields with Gneiting
### correlation function.
### One spatio-temporal replication is simulated
###
###############################################################

set.seed(331)
# Define the temporal sequence:
times <- seq(1,7,1)

# Simulation of a spatio-temporal Gaussian random field:
data <- RFsim(x, y, times, corrmodel="gneiting",
              param=list(mean=0,scale_s=0.4,scale_t=1,sill=sill,
              nugget=0,power_s=1,power_t=1,sep=0.5))$data

# Empirical spatio-temporal variogram estimation:
fit <- EVariogram(data, x, y, times, maxtime=5,maxdist=4)

# Results: Marginal spatial empirical  variogram
par(mfrow=c(2,2), mai=c(.5,.5,.3,.3), mgp=c(1.4,.5, 0))
plot(fit$centers, fit$variograms, xlab='h', ylab=expression(gamma(h)),
     ylim=c(0, max(fit$variograms)), xlim=c(0, max(fit$centers)),
     pch=20,main="Marginal spatial Variogram",cex.axis=.8)

# Results: Marginal temporal empirical  variogram
plot(fit$bint, fit$variogramt, xlab='t', ylab=expression(gamma(t)),
     ylim=c(0, max(fit$variograms)),xlim=c(0,max(fit$bint)),
     pch=20,main="Marginal temporal Variogram",cex.axis=.8)

# Building space-time variogram
st.vario <- matrix(fit$variogramst,length(fit$centers),length(fit$bint))
st.vario <- cbind(c(0,fit$variograms), rbind(fit$variogramt,st.vario))

# Results: 3d Spatio-temporal variogram
require(scatterplot3d)
st.grid <- expand.grid(c(0,fit$centers),c(0,fit$bint))
scatterplot3d(st.grid[,1], st.grid[,2], c(st.vario),
              highlight.3d=TRUE, xlab="h",ylab="t",
              zlab=expression(gamma(h,t)), pch=20,
              main="Space-time variogram",cex.axis=.7,
              mar=c(2,2,2,2), mgp=c(0,0,0),
              cex.lab=.7)

# A smoothed version
par(mai=c(.2,.2,.2,.2),mgp=c(1,.3, 0))
persp(c(0,fit$centers), c(0,fit$bint), st.vario,
      xlab="h", ylab="u", zlab=expression(gamma(h,u)),
      ltheta=90, shade=0.75, ticktype="detailed", phi=30,
      theta=30,main="Space-time variogram",cex.axis=.8,
      cex.lab=.8)


################################################################
###
### Example 3. Empirical estimation of the madogram from a
### max-stable random field (Extremal Gaussian model) with
### exponential correlation.
### n iid spatial replications are simulated.
###
###############################################################

set.seed(7273)
# Simulation of the max-stable random field:
data <- RFsim(x, y, corrmodel=corrmodel, model="ExtGauss",
              param=list(mean=mean, sill=sill, nugget=nugget,
              scale=scale), replicates=40)$data
# Tranform data from from common unit Frechet to standard Gumbel margins:
data <- Dist2Dist(data, to='sGumbel')

# Empirical madogram estimation:
fit <- EVariogram(data, x, y, type='madogram', replicates=40, cloud=FALSE)

# Results:
par(mfrow=c(1,2), mai=c(.6,.6,.3,.3), mgp=c(1.6,.6, 0))
plot(fit$centers, fit$variograms, xlab='h', ylab=expression(nu(h)),
     ylim=c(0, max(fit$variograms)), xlim=c(0, fit$srange[2]), pch=20,
     main="madogram")
plot(fit$centers, fit$extcoeff, xlab='h', ylab=expression(theta(h)),
     ylim=c(1, 2), xlim=c(0, fit$srange[2]), pch=20,
     main="extremal coefficient")






