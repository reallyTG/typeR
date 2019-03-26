library(Stem)


### Name: Stem.Simulation
### Title: Simulation of spatio-temporal data
### Aliases: Stem.Simulation
### Keywords: models spatial

### ** Examples

data(pm10)
names(pm10)

#extract the data
coordinates <- pm10$coords
covariates <- pm10$covariates
z <- pm10$z

#build the parameter list
phi <- list(beta=matrix(c(3.65,0.046,-0.904),3,1),
				sigma2eps=0.1,
				sigma2omega=0.2,
				theta=0.01,
				G=matrix(0.77,1,1),
				Sigmaeta=matrix(0.3,1,1),
				m0=as.matrix(0),
				C0=as.matrix(1))

K <-matrix(1,ncol(z),1)

mod1 <- Stem.Model(z=z,covariates=covariates,
coordinates=coordinates,phi=phi,K=K)

class(mod1)
is.Stem.Model(mod1)

simulateddata = Stem.Simulation(mod1)



