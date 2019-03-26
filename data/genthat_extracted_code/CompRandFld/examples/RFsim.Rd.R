library(CompRandFld)


### Name: RFsim
### Title: Simulation of Gaussian, Binary and Max-stable Random Fields
### Aliases: RFsim print.RFsim
### Keywords: Simulation

### ** Examples

library(CompRandFld)
library(RandomFields)
library(mapproj)
library(fields)

################################################################
###
### Example 1. Simulation of a Gaussian random field.
### Gaussian random fields with Whittle-Matern correlation.
### One spatial replication.
###
###
###############################################################

# Define the spatial-coordinates of the points:
x <- runif(500, 0, 2)
y <- runif(500, 0, 2)

set.seed(261)
# Simulation of a spatial Gaussian random field:
data <- RFsim(x, y, corrmodel="matern", param=list(smooth=0.5,
             mean=0,sill=1,scale=0.2,nugget=0))$data

################################################################
###
### Example 2. Simulation of a binary random field based on
### the latent Gaussian random field with exponential correlation.
### One spatial replication on a regular grid
###
###
###############################################################

# Define the spatial-coordinates of the points:
x <- seq(0, 1, 0.05)
y <- seq(0, 1, 0.05)

set.seed(251)

# Simulation of a spatial binary random field:
sim <- RFsim(x, y, corrmodel="exponential", grid=TRUE,
             model="BinaryGauss", threshold=0,
             param=list(nugget=0,mean=0,scale=.1,sill=1))

image(x,y,sim$data,col=terrain.colors(100))

################################################################
###
### Example 3. Simulation of a max-stable random
### extremal-t type with exponential correlation.
### One spatial replication on a regular grid
###
###
###############################################################

set.seed(341)
x <- seq(0, 1, 0.02)
y <- seq(0, 1, 0.02)
# Simulation of a spatial binary random field:
sim <- RFsim(x, y, corrmodel="exponential", grid=TRUE, model="ExtT",
             numblock=500, param=list(nugget=0,mean=0,scale=.1,
             sill=1,df=5))

image.plot(x,y,log(sim$data))


################################################################
###
### Example 4. Simulation of a Gaussian random field.
### with double exponential correlation.
### One spatio-temporal replication.
###
###
###############################################################

# Define the spatial-coordinates of the points:
x <- seq(0, 1, 0.1)
y <- seq(0, 1, 0.1)
# Define the temporal-coordinates:
times <- seq(1, 3, 1)
#
# Simulation of a spatial Gaussian random field:
sim <- RFsim(x, y, times, corrmodel="exp_exp", grid=TRUE,
             param=list(nugget=0,mean=0,scale_s=0.3,
             scale_t=0.5,sill=1))$data
# Spatial simulated data at first temporal instant
 sim[,,1]




################################################################
###
### Example 5. Simulation of a Gaussian random field
### with  exponential correlation on a portion of  the earth surface
### One spatial replication.
###
###
###############################################################

lon_region<-c(-40,40)
lat_region<-c(-40,40)
#
lon<-seq(min(lon_region),max(lon_region),2)
lat<-seq(min(lat_region),max(lat_region),2)
#
data<-RFsim(coordx=lon,coordy=lat,corrmodel="exponential",
         distance="Geod",grid=TRUE,param=list(nugget=0,mean=0
         ,scale=8000,sill=1))$data
image.plot(lon,lat,data,xlab="Longitude",ylab="Latitude")
map(database="world",xlim=lon_region,ylim=lat_region,add=TRUE)



