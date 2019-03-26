library(StempCens)


### Name: EstStempCens
### Title: ML estimation in spatio-temporal model with censored/missing
###   responses
### Aliases: EstStempCens

### ** Examples

# Initial parameter values
beta <- c(-1,1.50); phi <- 5; rho <- 0.45; tau2 <- 0.80; sigma2 <- 1.5
# Simulating data
n1 <- 9    # Number of spatial locations
n2 <- 4    # Number of temporal index
set.seed(700)
x.coord <- round(runif(n1,0,10),9)   # X coordinate
y.coord <- round(runif(n1,0,10),9)   # Y coordinate
coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
coord2 <- cbind(rep(x.coord,each=n2),rep(y.coord,each=n2)) # Cartesian coordinates with repetitions
time <- as.matrix(seq(1,n2,1))      # Time index without repetitions
time2 <- as.matrix(rep(time,n1))    # Time index with repetitions
x1 <- rexp(n1*n2,2)
x2 <- rnorm(n1*n2,2,1)
x <- cbind(x1,x2)
media <- x%*%beta
# Covariance matrix
H <- as.matrix(dist(coordenadas)) # Spatial distances
Mt <- as.matrix(dist(time))       # Temporal distances
Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="exponential")
# Data
require(mvtnorm)
y <- as.vector(rmvnorm(1,mean=as.vector(media),sigma=Cov))
perc <- 0.2
aa=sort(y);  bb=aa[1:(perc*n1*n2)];  cutof<-bb[perc*n1*n2]
cc=matrix(1,(n1*n2),1)*(y<=cutof)
y[cc==1] <- cutof
# Estimation
est_teste <- EstStempCens(y, x, cc, time2, coord2, inits.phi=3.5, inits.rho=0.5, inits.tau2=0.7,
                          type.Data="balanced", cens.type="left", method="nlminb", kappa=0,
                          type.S="exponential",
                          IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,20), M=20,
                          perc=0.25, MaxIter=25, pc=0.2, error = 10^-6)

## Not run: 
##D # New York data
##D library(spTimer)
##D library(sp)
##D library(rgdal)
##D # Transform coordinates
##D station <- as.data.frame(NYdata[,2:3])
##D names(station) <- c("lon","lat")
##D coordinates(station) <- ~lon+lat
##D proj4string(station) <- CRS("+init=epsg:32116 +proj=longlat +datum=NAD83 +no_defs
##D                              +ellps=GRS80 +towgs84=0,0,0")
##D station2 <- spTransform(station,CRS("+proj=utm +zone=18 +north +datum=NAD83"))
##D station <- as.data.frame(station2)
##D names(station) <- c("x.Coord","y.Coord")
##D NYdata <- cbind(NYdata,station)
##D coord <- unique(station)
##D EstEstimation <- c(1,2,3,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,22,23,24,26,27,28)
##D EstEstimation <- coord[EstEstimation,]
##D dataEstimation <- NYdata[(NYdata[,11]%in%EstEstimation[,1])&(NYdata[,12]%in%EstEstimation[,2]),]
##D cc <- vector("numeric",length=nrow(dataEstimation))
##D cc[is.na(dataEstimation$o8hrmax)==1] <- 1
##D time <- rep(seq(1,62),nrow(EstEstimation))
##D dados <- cbind(dataEstimation,cc,time)
##D names(dados) <- c("s.index","Longitude","Latitude","Year","Month","Day","o8hrmax","cMAXTMP",
##D                   "WDSP","RH","x.Coord","y.Coord","censure","time")
##D # Data
##D y     <- dados$o8hrmax
##D cc    <- dados$censure
##D x     <- as.matrix(cbind(dados$cMAXTMP,dados$WDSP,dados$RH))
##D tempo <- as.data.frame(dados$time)
##D coord <- as.matrix(cbind(dados$x.Coord/1000,dados$y.Coord/1000)) # Coordinates in Km
##D # Power exponential model for the spatial covariance structure
##D est <- EstStempCens(y, x, cc, tempo, coord, inits.phi = 50, inits.rho = 0.30, inits.tau2 = 25,
##D                     type.Data="balanced", cens.type="missing", method="nlminb", kappa=0.50,
##D                     type.S="pow.exp",
##D                     IMatrix=TRUE, lower.lim=c(0.01,-0.80,0.01), upper.lim=c(500,0.80,150), M=20,
##D                     perc=0.25, MaxIter=500, pc=0.2, error = 10^-5)
## End(Not run)



