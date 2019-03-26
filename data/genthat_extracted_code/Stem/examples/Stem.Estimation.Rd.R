library(Stem)


### Name: Stem.Estimation
### Title: ML Estimation
### Aliases: Stem.Estimation
### Keywords: models spatial

### ** Examples

#load the data
data(pm10)

#extract the data
coordinates <- pm10$coords
covariates <- pm10$covariates
z <- pm10$z

#build the parameter list 
#(the phi list is used for the algorithm starting values)
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

#mod1 is given as output by the Stem.Model function
mod1.est <- Stem.Estimation(mod1)
phi.estimates <- unlist(mod1.est$estimates$phi.hat)
 



