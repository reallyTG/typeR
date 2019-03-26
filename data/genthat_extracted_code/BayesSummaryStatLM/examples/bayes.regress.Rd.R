library(BayesSummaryStatLM)


### Name: bayes.regress
### Title: MCMC posterior sampling of Bayesian linear regression model
###   parameters using only summary statistics
### Aliases: bayes.regress
### Keywords: combine consensus subposterior posterior parallel

### ** Examples

##################################################
## Simulate data 
##################################################

set.seed(284698)

num.samp  <- 100 # number of data values to simulate

# The first value of the beta vector is the y-intercept:
beta <- c(-0.33, 0.78, -0.29, 0.47, -1.25)

# Calculate the number of predictor variables:
num.pred <- length(beta)-1

rho       <- 0.0  # correlation between predictors
mean.vec  <- rep(0,num.pred)
sigma.mat <- matrix(rho,num.pred,num.pred) + diag(1-rho,num.pred)
sigmasq.sim <- 0.05

# Simulate predictor variables:
x.pre       <- rmvn(num.samp, mu=mean.vec, sigma=sigma.mat)       

# Add leading column of 1's to x.pre for y-intercept:
x <- cbind(rep(1,num.samp),x.pre)

epsilon <- rnorm(num.samp, mean=0, sd=sqrt(sigmasq.sim))

y  <- as.numeric( x %*% as.matrix(beta) +  epsilon)

## Compute summary statistics (alternatively, the
# "read.regress.data.ff() function (in this package) can be 
# used to calculate summary statistics; see example below).

xtx <- t(x)%*%x 
xty <- t(x)%*%y 
yty <- t(y)%*%y 

data.values<-list(xtx=xtx, xty=xty, yty=yty,
                  numsamp.data = num.samp, 
                  xtx.inv = chol2inv(chol(xtx)))

##########################################################
## Bayesian linear regression analysis
##########################################################

Tsamp.out <- 100 # number of MCMC samples to produce

## Choose priors for beta and sigma-squared. Here,
# beta: Uniform prior; sigma-squared: Inverse Gamma prior. 

beta.prior    <- list( type = "flat")
sigmasq.prior <- list(type = "inverse.gamma", inverse.gamma.a = 1.0, 
                      inverse.gamma.b = 1.0, sigmasq.init = 1.0 )

set.seed(284698)

# Run the "bayes.regress" function using the data simulated above.

MCMC.out <- bayes.regress(data.values, 
                          beta.prior, 
                          sigmasq.prior = sigmasq.prior, 
                          Tsamp.out = Tsamp.out)

# Next, print the posterior means of the unknown model parameters.
# Alternatively, the "coda" package can be used for analysis.

print(c(colMeans(MCMC.out$beta), mean(MCMC.out$sigmasq)))

# Check that output is close to simulated values (although num.samp and
# Tsamp.out are small here); note that the output includes both beta and 
# sigmasq:
# c(-0.33,  0.78, -0.29,  0.47, -1.25,  0.05)

## Run all 6 combinations of priors for 3 "beta.prior" choices and 
#  2 "sigmasq.prior" choices:

beta.priors <- list(
  list( type = "flat"),
  
  list( type = "mvnorm.known", 
        mean.mu = rep(0.0,    (num.pred+1)), 
        prec.Cinv = diag(1.0, (num.pred+1))),
        
  list( type = "mvnorm.unknown",
        mu.hyper.mean.eta         = rep(0.0,(num.pred+1)),  
        mu.hyper.prec.Dinv        = diag(1.0, (num.pred+1)),  
        Cinv.hyper.df.lambda      = (num.pred+1), 
        Cinv.hyper.invscale.Vinv  = diag(1.0, (num.pred+1)),  
        mu.init                   = rep(1.0, (num.pred+1)), 
        Cinv.init                 = diag(1.0,(num.pred+1)))   
)

sigmasq.priors <- list(
  list(type = "inverse.gamma", 
       inverse.gamma.a = 1.0, 
       inverse.gamma.b = 1.0, 
       sigmasq.init = 0.1 ),       
  list( type="sigmasq.inverse", sigmasq.init = 0.1)
)

for (beta.prior in beta.priors)
{
  for(sigmasq.prior in sigmasq.priors)
  {
    set.seed(284698)
    MCMC.out <- bayes.regress(data.values, 
                              beta.prior, 
                              sigmasq.prior = sigmasq.prior, 
                              Tsamp.out = Tsamp.out)
    print(c(colMeans(MCMC.out$beta), mean(MCMC.out$sigmasq)))
  }
}

# Check that output is close to simulated values (although num.samp and
# Tsamp.out are small here); note that the output includes both beta and 
# sigmasq:
# c(-0.33,  0.78, -0.29,  0.47, -1.25,  0.05):


#######################################################################
## Read the data from a file, calculate the summary statistics and run 
## the Bayesian linear regression analysis
#######################################################################

Tsamp.out <- 100

## Assume non-zero y-intercept data.

# Read the files and compute summary statistics using the "read.regress.data.ff()" 
# function (in this package).


filename <- system.file('data/regressiondata.nz.all.csv.gz', package='BayesSummaryStatLM')
data.values <- read.regress.data.ff(filename)

# Calculate the number of predictors.

num.pred <- length(data.values$xty)-1

## Run all 6 combinations of priors for 3 "beta.prior" choices and 
#  2 "sigmasq.prior" choices:

beta.priors <- list(
  list( type = "flat"),
  
  list( type = "mvnorm.known", 
        mean.mu = rep(0.0,    (num.pred+1)), 
        prec.Cinv = diag(1.0, (num.pred+1))),
        
  list( type="mvnorm.unknown",
        mu.hyper.mean.eta         = rep(0.0,  (num.pred+1)),  
        mu.hyper.prec.Dinv    	  = diag(1.0, (num.pred+1)),  
        Cinv.hyper.df.lambda      = (num.pred+1), 
        Cinv.hyper.invscale.Vinv  = diag(1.0, (num.pred+1)),  
        mu.init                   = rep(1.0, (num.pred+1)),      
        Cinv.init                 = diag(1.0,(num.pred+1)))   
)

sigmasq.priors <- list(
  list(type = "inverse.gamma", inverse.gamma.a = 1.0, 
               inverse.gamma.b = 1.0, sigmasq.init = 0.5 ),
  list( type = "sigmasq.inverse", sigmasq.init = 0.5)
)

for (beta.prior in beta.priors)
{
  for(sigmasq.prior in sigmasq.priors)
  {

    set.seed(284698)
    MCMC.out <- bayes.regress(data.values, 
                              beta.prior, 
                              sigmasq.prior = sigmasq.prior, 
                              Tsamp.out = Tsamp.out)
                              
    print(c(colMeans(MCMC.out$beta), mean(MCMC.out$sigmasq)))
  }
}

# Check that output is close to simulated values (although num.samp and
# Tsamp.out are small here); note that the output includes both beta and                           
# sigmasq:
# c( 0.76, -0.92, 0.64, 0.57, -1.65, 0.25)





