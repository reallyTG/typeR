library(BayesRS)


### Name: modelrun
### Title: Bayes Factors, Posterior Samples, & DIC
### Aliases: modelrun

### ** Examples


data(bayesrsdata) #load data

## Don't show: 
## JAGS Sampler Settings
# -----------------
# nr of adaptation, burn-in, and saved mcmc steps only for exemplary use
nadapt = 100         # number of adaptation steps
nburn = 10           # number of burn-in samples
mcmcstep = 500       # number of saved mcmc samples, min. should be 100'000

# Define model structure;
dat.str <- data.frame(iv = c("x.time"),
                      type = c("cont"),
                      subject = c(1))
# name of random variable (here 'subject') needs to match data frame

# Run modelrun function
out <- modelrun(data = bayesrsdata,
                dv = "y",
                dat.str = dat.str,
                nadapt = nadapt,
                nburn = nburn,
                nsteps = mcmcstep,
                checkconv = 0)

# Obtain Bayes factor
bf <- out[[1]]
bf

## -----------------------------------------------------------------
## Example 2: Estimation of Bayes Factors from a continuous
## independent variable with random slopes that
## are correlated with the random slopes of a categorical variable.
## - Repeated measures for each participant
## - a continuous IV with 5 values: x.time
## - a categorical variable with 2 levels: x.domain
## ------------------------------------------------------------------

## JAGS Sampler Settings
# nr of adaptation, burn-in, and saved mcmc steps only for exemplary use
# -----------------
nadapt = 100         # number of adaptation steps
nburn = 10           # number of burn-in samples
mcmcstep = 500       # number of saved mcmc samples, min. should be 100'000


# Define model structure;
# order of IVs: continuous variable(s) needs to go first
dat.str <- data.frame(iv = c("x.time", "x.domain"),
                      type = c("cont", "cat"),
                      subject = c(1,1))
# name of random variable (here 'subject') needs to match data frame

# Define random effect structure on interaction for each random variable
ias.subject <- matrix(0, nrow=nrow(dat.str), ncol = nrow(dat.str))
ias.subject[c(2)] <- 1
randvar.ia <- list(ias.subject)

# Define correlation structure between predictors within a random variable
cor.subject <- matrix(0, nrow=nrow(dat.str)+1, ncol = nrow(dat.str)+1)
cor.subject[c(2,3,6)] <- 1
corstr <- list(cor.subject)

# Run modelrun function
out <- modelrun(data = bayesrsdata,
                dv = "y",
                dat.str = dat.str,
                randvar.ia = randvar.ia,
                nadapt = nadapt,
                nburn = nburn,
                nsteps = mcmcstep,
                checkconv = 0,
                mcmc.save.indiv = 1,
                corstr = corstr)

# Obtain Bayes factors for continous main effect,
# categorical main effect, and their interaction
bf <- out[[1]]
bf
## End(Don't show)

## No test: 

## -----------------------------------------------------------------
## Example 1: Estimation of Bayes Factors from a continuous
## independent variable (IV) with random slopes
## - repeated measures for each participant
## - continuous variable with 5 values: x.time
## ------------------------------------------------------------------

## JAGS Sampler Settings
# -----------------
# nr of adaptation, burn-in, and saved mcmc steps only for exemplary use
nadapt = 2000           # number of adaptation steps
nburn = 2000            # number of burn-in samples
mcmcstep = 100000       # number of saved mcmc samples, min. should be 100'000

# Define model structure;
dat.str <- data.frame(iv = c("x.time"),
                      type = c("cont"),
                      subject = c(1))
# name of random variable (here 'subject') needs to match data frame

# Run modelrun function
out <- modelrun(data = bayesrsdata,
                dv = "y",
                dat.str = dat.str,
                nadapt = nadapt,
                nburn = nburn,
                nsteps = mcmcstep,
                checkconv = 0)

# Obtain Bayes factor
bf <- out[[1]]
bf

## -----------------------------------------------------------------
## Example 2: Estimation of Bayes Factors from a continuous
## independent variable with random slopes that
## are correlated with the random slopes of a categorical variable.
## - Repeated measures for each participant
## - a continuous IV with 5 values: x.time
## - a categorical variable with 2 levels: x.domain
## ------------------------------------------------------------------

## JAGS Sampler Settings
# nr of adaptation, burn-in, and saved mcmc steps only for exemplary use
# -----------------
nadapt = 2000         # number of adaptation steps
nburn = 2000           # number of burn-in samples
mcmcstep = 100000       # number of saved mcmc samples, min. should be 100'000

# Define model structure;
# order of IVs: continuous variable(s) needs to go first
dat.str <- data.frame(iv = c("x.time", "x.domain"),
                      type = c("cont", "cat"),
                      subject = c(1,1))
# name of random variable (here 'subject') needs to match data frame

# Define random effect structure on interaction for each random variable
ias.subject <- matrix(0, nrow=nrow(dat.str), ncol = nrow(dat.str))
ias.subject[c(2)] <- 1
randvar.ia <- list(ias.subject)

# Define correlation structure between predictors within a random variable
cor.subject <- matrix(0, nrow=nrow(dat.str)+1, ncol = nrow(dat.str)+1)
cor.subject[c(2,3,6)] <- 1
corstr <- list(cor.subject)

# Run modelrun function
out <- modelrun(data = bayesrsdata,
                dv = "y",
                dat.str = dat.str,
                randvar.ia = randvar.ia,
                nadapt = nadapt,
                nburn = nburn,
                nsteps = mcmcstep,
                checkconv = 0,
                mcmc.save.indiv = 1,
                corstr = corstr)

# Obtain Bayes factors for continous main effect,
# categorical main effect, and their interaction
bf <- out[[1]]
bf
## End(No test)



