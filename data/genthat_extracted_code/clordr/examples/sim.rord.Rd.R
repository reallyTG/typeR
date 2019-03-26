library(clordr)


### Name: sim.rord
### Title: Simulation of Replciations of Spatial Ordinal Data
### Aliases: sim.rord

### ** Examples

set.seed(1203)
n.subject <- 100
n.lat <- n.lon <- 10
n.site <- n.lat*n.lon

beta <- c(1,2,-1) # First 1 here is the intercept
midalpha <- c(1.15, 2.18) ; phi <- 0.8 ; sigma2 <- 0.7

true <- c(midalpha,beta,sigma2,phi)

Xi <- rnorm(n.subject,0,1) ; Xj <- rbinom(n.site,1,0.6)

 VV <- matrix(NA, nrow = n.subject*n.site, ncol = 3)

 for(i in 1:n.subject){ for(j in 1:n.site){
     VV[(i-1)*n.site+j,] <- c(1,Xi[i],Xj[j])
       }
 }

location <- cbind(rep(seq(1,n.lat,length=n.lat),n.lat),rep(1:n.lon, each=n.lon))
sim.data <- sim.rord(n.subject, n.site, n.rep = 2, midalpha, beta, phi, sigma2, covar=VV, location)

length(sim.data)
head(sim.data[[1]])
dim(sim.data[[1]])
hist(sim.data[[1]])



