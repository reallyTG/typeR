library(BayesESS)


### Name: ess
### Title: Determines effective sample size of a parametric prior
###   distribution
### Aliases: ess
### Keywords: ess

### ** Examples

library(BayesESS)
# Calculating ESS for a beta-binomial model with
# beta(1,2) prior
ess(model='betaBin',prior=c('beta',1,2))

# Calculating ESS for a gamma-exponential model with
# gamma(2,4) prior
ess(model='gammaEx',prior=c('gamma',2,4))

# Calculating ESS for a gamma-Poisson model with
# gamma(2,4) prior
ess(model='gammaPois',prior=c('gamma',2,4))

# Calculating ESS for a dirichlet-multinomial model with
# dirichlet(10,15,20) prior
ess(model='dirMult',prior=c('dirichlet',10,15,20))

# Calculating ESS for a scaled-inverse-chi-squared-normal model
# when mean is known and variance is unknown
# with scaled-inverse-chi-squared(nu_0=10,sigma^2_0=1) prior for variance
# ESS for such model can be found analytically
ess(model='invChisqNorm',prior=c(10,1))

# Calculating ESS for a normal-normal model
# when mean is unknown and variance is known
# with normal(mu_0=10,sigma^2=1,n_0=30) prior (i.e. known variance is sigma^2=1)
# ESS for such model can be found analytically (ESS = n_0)
ess(model='normNorm',prior=c('norm',10,1,30))

# Calculating ESS for a scaled-inverse-chi-squared-normal model
# when mean and variance are both unknown
# with scaled-inverse-chi-squared(nu_0=10,sigma^2_0=1) prior for variance
# and normal(mu_0=1,sigma^2/phi=sigma^2/30) prior for mean
# Smaller nsim = 1000 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
## Not run: 
##D ess(model='invChisqNorm',prior=c(10,1,1,30),m=20,nsim=1000)
## End(Not run)

# Calculating ESS for a inverse-gamma-normal model
# when mean is known and variance is unknown
# with inverse-gamma(alpha=5,beta=5) prior
# Note: the inverse-gamma(nu_0/2,nu_0*sigma^2_0/2) prior is
# equivalent to scaled-inverse-chi-squared(nu_0,sigma^2_0)
# ESS for such model can be found analytically
ess(model='invGammaNorm',prior=c(5,5))

# Calculating ESS for a inverse-gamma-normal model
# when mean and variance are both unknown
# with inverse-gamma(alpha=5,beta=5) prior
# and normal(mu_0=1,sigma^2/phi=sigma^2/30) prior for mean
# Note: the inverse-gamma(nu_0/2,nu_0*sigma^2_0/2) prior is
# equivalent to scaled-inverse-chi-squared(nu_0,sigma^2_0)
# Smaller nsim = 1000 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
## Not run: 
##D ess(model='invGammaNorm',prior=c(5,5,1,30),m=20,nsim=1000)
## End(Not run)

# Calculating ESS for a linear regression model with
# three covariates, with priors specified as
# beta0 ~ N(0,1); beta1 ~ N(0,.1); beta2 ~ N(0,.2); beta3 ~ N(0,.3); tau ~ Gamma(1,1);
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='linreg',label=c('beta0','beta1','beta2','beta3','tau'),
##D prior=list(c('norm',0,1),c('norm',0,.1),c('norm',0,.2),c('norm',0,.3),c('gamma',1,1)),
##D ncov=3,m=50,nsim=50,svec1=c(0,1,1,1,0),svec2=c(0,0,0,0,1))
## End(Not run)

# Calculating ESS for a linear regression model with
# two covariates, with priors specified as
# beta0 ~ N(0,1); beta1 ~ N(0,.1); beta2 ~ N(0,.2); tau ~ Gamma(1,1);
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='linreg',label=c('beta0','beta1','beta2','tau'),
##D prior=list(c('norm',0,1),c('norm',0,.1),c('norm',0,.2),c('gamma',1,1)),
##D ncov=2,m=50,nsim=50,svec1=c(0,1,1,0),svec2=c(0,0,0,1))
## End(Not run)

# Calculating ESS for a logistic regression model with
# three covariates, with priors specified as
# beta0 ~ N(0,1); beta1 ~ N(0,1); beta2 ~ N(0,1); beta3 ~ N(0,1)
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='logistic',label=c('beta0','beta1','beta2','beta3'),
##D prior=list(c('norm',0,1),c('norm',0,1),c('norm',0,1),c('norm',0,1)),
##D ncov=3,m=50,nsim=50,svec1=c(1,0,0,0),svec2=c(0,1,1,1))
## End(Not run)

# Calculating ESS for a continual reassessment method (CRM)
# with true toxicity probabilites PI=c(.02,.06,.10,.18,.30)
# prior is specified as N(0,2.5) with target DLT = 0.2
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='crm',prior=c(.02,.06,.10,.18,.30),
##D        m=7,nsim=50,
##D        PI=c(.02,.06,.10,.18,.30),
##D        betaSD=sqrt(2.5),target=0.2)
## End(Not run)

# Calculating ESS for a TITE CRM
# with true toxicity probabilites PI=c(.02,.06,.10,.18,.30)
# prior is specified as N(0,1.5) with target DLT = 0.2
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='tite.crm',prior=c(.02,.06,.10,.18,.30),
##D        m=7,nsim=50,
##D        PI=c(.02,.06,.10,.18,.30),
##D        betaSD=sqrt(1.5),target=0.2,obswin=30,rate=2,
##D        accrual="poisson")
## End(Not run)

# Calculating ESS for a time to event model
# prior is specified as inverse-gamma(5.348,30.161)
# Smaller nsim = 50 is specified for illustration purposes
# The user can use nsim = 10,000 to carry out the most accurate ESS computations.
# The value of nsim as low as 1,000 may be used to reduce runtime.
## Not run: 
##D ess(model='surv',shapeParam=5.348,scaleParam=30.161,m=7,nsim=50)
## End(Not run)



