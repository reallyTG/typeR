library(eigenmodel)


### Name: eigenmodel_mcmc
### Title: Approximate the posterior distribution of parameters in an
###   eigenmodel
### Aliases: eigenmodel_mcmc
### Keywords: models multivariate

### ** Examples



data(YX_Friend)

fit<-eigenmodel_mcmc(Y=YX_Friend$Y,X=YX_Friend$X,R=2,S=50,burn=50)

# in general you  should run the Markov chain longer than 50 scans

plot(fit)

#fit<-eigenmodel_mcmc(Y=Y_Gen,R=3,S=10000)

#fit<-eigenmodel_mcmc(Y=Y_Pro,R=3,S=10000)





