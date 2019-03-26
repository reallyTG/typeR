library(MCMCglmm)


### Name: gelman.prior
### Title: Prior Covariance Matrix for Fixed Effects.
### Aliases: gelman.prior
### Keywords: distribution

### ** Examples

dat<-data.frame(y=c(0,0,1,1), x=gl(2,2))
# data with complete separation

#####################
# probit regression #
#####################

prior1<-list(
  B=list(mu=c(0,0), V=gelman.prior(~x, data=dat, scale=sqrt(1+1))), 
  R=list(V=1,fix=1))

m1<-MCMCglmm(y~x, prior=prior1, data=dat, family="ordinal", verbose=FALSE)

c2<-1
p1<-pnorm(m1$Sol[,1]/sqrt(1+c2)) # marginal probability when x=1

#######################
# logistic regression #
#######################

prior2<-list(B=list(mu=c(0,0), V=gelman.prior(~x, data=dat, scale=sqrt(pi^2/3+1))),
             R=list(V=1,fix=1))

m2<-MCMCglmm(y~x, prior=prior2, data=dat, family="categorical", verbose=FALSE)

c2 <- (16 * sqrt(3)/(15 * pi))^2
p2<-plogis(m2$Sol[,1]/sqrt(1+c2)) # marginal probability when x=1

plot(mcmc.list(p1,p2))





