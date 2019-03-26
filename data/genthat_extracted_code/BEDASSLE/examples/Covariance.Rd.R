library(BEDASSLE)


### Name: Covariance
### Title: The parametric covariance matrix
### Aliases: Covariance

### ** Examples

#With the HGDP dataset
	data(HGDP.bedassle.data)
	
#Draw random values of the {alpha} parameters from their priors
	alpha0 <- rgamma(1,shape=1,rate=1)
	alphaD <- rexp(1,rate=1)
	alphaE <- matrix(rexp(1,rate=1),nrow=1,ncol=1)
	alpha2 <- runif(1,0.1,2)

#Parameterize the covariance function using the HGDP dataset distances (Geo and Eco)
	example.covariance <- Covariance(a0 = alpha0,aD = alphaD,aE = alphaE,a2 = alpha2,
				GeoDist = HGDP.bedassle.data$GeoDistance,
				EcoDist = list(HGDP.bedassle.data$EcoDistance),
				delta = 0.001)

#Plot the example covariance against geographic distance
	plot(HGDP.bedassle.data$GeoDistance,
		example.covariance,
		pch=19,col=HGDP.bedassle.data$EcoDistance+1,
		main="Covariance in allele frequencies across the Himalayas")
			legend(x="topright",pch=19,col=c(1,2),
				legend=c("same side of Himalayas",
							"opposite sides of Himalayas"))



