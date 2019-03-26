library(StempCens)


### Name: DiagStempCens
### Title: Diagnostic in spatio-temporal model with censored/missing
###   responses
### Aliases: DiagStempCens

### ** Examples

# Initial parameter values
beta <- c(-1,1.5); phi <- 3; rho <- 0.40; tau2 <- 1; sigma2 <- 2
# Simulating data
n1 <- 8    # Number of spatial locations
n2 <- 4    # Number of temporal index
set.seed(700)
x.coord <- round(runif(n1,0,10),9)   # X coordinate
y.coord <- round(runif(n1,0,10),9)   # Y coordinate
coordenadas <- cbind(x.coord,y.coord) # Cartesian coordinates without repetitions
coord2 <- cbind(rep(x.coord,each=n2),rep(y.coord,each=n2)) # Cartesian coordinates with repetitions
time <- as.matrix(seq(1,n2,1))   # Time index without repetitions
time2 <- as.matrix(rep(time,n1)) # Time index with repetitions
x1 <- rexp(n1*n2,2)
x2 <- rnorm(n1*n2,2,1)
x <- cbind(x1,x2)
media <- x%*%beta
# Covariance matrix
H <- as.matrix(dist(coordenadas)) # Spatial distances
Mt <- as.matrix(dist(time))       # Temporal distances
Cov <- CovarianceM(phi,rho,tau2,sigma2,distSpa=H,disTemp=Mt,kappa=0,type.S="gaussian")
# Data
require(mvtnorm)
y <- as.vector(rmvnorm(1,mean=as.vector(media),sigma=Cov))
perc <- 0.1
aa=sort(y);  bb=aa[1:(perc*n1*n2)];  cutof<-bb[perc*n1*n2]
cc=matrix(1,(n1*n2),1)*(y<=cutof)
y[cc==1] <- cutof
y[17] <- abs(y[17])+2*sd(y)
# Estimation
est <- EstStempCens(y, x, cc, time2, coord2, inits.phi=2.5, inits.rho=0.5, inits.tau2=0.8,
                    type.Data="balanced", cens.type="left", method="nlminb", kappa=0,
                    type.S="gaussian",
                    IMatrix=TRUE, lower.lim=c(0.01,-0.99,0.01), upper.lim=c(30,0.99,20), M=20,
                    perc=0.25, MaxIter=10, pc=0.2, error = 10^-6)
# Diagnostic
diag <- DiagStempCens(est, type.diag="time", diag.plot = TRUE, ck=1)



