library(wiqid)


### Name: weta
### Title: Detection data for weta in gorse bushes
### Aliases: weta
### Keywords: datasets

### ** Examples

data(weta)

DH <- weta[, 1:5]  # extract the detection history:
occSS(DH)
occSStime(DH, p~.time)
# With covariates
occSS(DH, list(psi ~ Browsed, p ~ ObsD), data=weta)
occSS(DH, list(psi ~ Browsed, p ~ Browsed), data=weta)

# Bayesian analysis
## No test: 
# Model with separate intercepts for occupancy in Browsed and Unbrowsed
#  bushes, and a time trend for probability of detection; specify uniform
#  priors for probability of occupancy:
Bwet <- BoccSS(DH, model=list(psi~Browsed-1, p~.Time), data=weta,
  priors=list(sigmaPsi=c(1,1)), chains=2)
Bwet
plot(Bwet)
plot(Bwet, "p_.Time")
## End(No test)



