library(ald)


### Name: momentsALD
### Title: Moments for the Asymmetric Laplace Distribution
### Aliases: momentsALD meanALD varALD skewALD kurtALD momentALD absALD
### Keywords: asymmetric laplace distribution quantile regression Laplace
###   moments ALD

### ** Examples

## Let's compute some moments for a Symmetric Standard Laplace Distribution.

#Third raw moment
momentALD(k=3,mu=0,sigma=1,p=0.5)

#The well known mean, variance, skewness and kurtosis
meanALD(mu=0,sigma=1,p=0.5)
varALD(mu=0,sigma=1,p=0.5)
skewALD(mu=0,sigma=1,p=0.5)
kurtALD(mu=0,sigma=1,p=0.5)

# and this guy
absALD(sigma=1,p=0.5)



