library(MHadaptive)


### Name: Metro_Hastings
### Title: Markov Chain Monte Carlo for Bayesian Inference using adaptive
###   Metropolis-Hastings
### Aliases: Metro_Hastings gettingstarted.MHadaptive

### ** Examples


### A LINEAR REGRESSION EXAMPLE ####
## Define a Bayesian linear regression model
li_reg<-function(pars,data)
{
    a<-pars[1]      #intercept
    b<-pars[2]      #slope
    sd_e<-pars[3]   #error (residuals)
    if(sd_e<=0){return(NaN)}
    pred <- a + b * data[,1]
    log_likelihood<-sum( dnorm(data[,2],pred,sd_e, log=TRUE) )
    prior<- prior_reg(pars)
    return(log_likelihood + prior)
}

## Define the Prior distributions
prior_reg<-function(pars)
{
    a<-pars[1]          #intercept
    b<-pars[2]          #slope  
    epsilon<-pars[3]    #error

    prior_a<-dnorm(a,0,100,log=TRUE)     ## non-informative (flat) priors on all 
    prior_b<-dnorm(b,0,100,log=TRUE)     ## parameters.  
    prior_epsilon<-dgamma(epsilon,1,1/100,log=TRUE)      

    return(prior_a + prior_b + prior_epsilon)
}

# simulate data
x<-runif(30,5,15)
y<-x+rnorm(30,0,5)
d<-cbind(x,y)


mcmc_r<-Metro_Hastings(li_func=li_reg,pars=c(0,1,1),
    par_names=c('a','b','epsilon'),data=d)

##  For best results, run again with the previously 
##  adapted variance-covariance matrix.

mcmc_r<-Metro_Hastings(li_func=li_reg,pars=c(0,1,1),
    prop_sigma=mcmc_r$prop_sigma,par_names=c('a','b','epsilon'),data=d)

mcmc_r<-mcmc_thin(mcmc_r)
plotMH(mcmc_r)



