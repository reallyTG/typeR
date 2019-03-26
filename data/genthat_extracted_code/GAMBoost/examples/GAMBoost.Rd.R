library(GAMBoost)


### Name: GAMBoost
### Title: Generalized additive model by likelihood based boosting
### Aliases: GAMBoost
### Keywords: models smooth regression

### ** Examples

##  Generate some data 
n <- 100; p <- 8; q <- 2

#   covariates with non-linear (smooth) effects
x <- matrix(runif(n*p,min=-1,max=1),n,p)             

#   binary covariates
x.linear <- matrix(round(runif(n*q,min=0,max=1)),n,q)

#   1st and 3rd smooth covariate and 1st linear covariate are informative
eta <- -0.5 + 2*x[,1] + 2*x[,3]^2 + x.linear[,1]-.5

y <- rbinom(n,1,binomial()$linkinv(eta))

##  Fit a model with just smooth components
gb1 <- GAMBoost(x,y,penalty=500,stepno=100,family=binomial(),trace=TRUE) 

#   Inspect the AIC for a minimum
plot(gb1$AIC) # still falling at boosting step 100 so we need more steps
              # or a smaller penalty (use 'optimGAMBoostPenalty' for
              # automatic penalty optimization)

##  Include two binary covariates as mandatory without penalty
##  (appropriate for example for 'treatment/control')
##  modelled as 'linear' predictors

gb2 <- GAMBoost(x,y,penalty=200,
                x.linear=x.linear,penalty.linear=0,
                stepno=100,family=binomial(),trace=TRUE) 

##  Include first binary covariates as mandatory and second
##  as optional (e.g 'treatment/control' and 'female/male')

gb3 <- GAMBoost(x,y,penalty=200,
                x.linear=x.linear,penalty.linear=c(0,100),
                stepno=100,family=binomial(),trace=TRUE) 

#   Get summary with fitted covariates and estimates for
#   the parametric components
summary(gb3)

#   Extract boosted components at 'optimal' boosting step
selected <- getGAMBoostSelected(gb3,at.step=which.min(gb3$AIC))

#   Plot all smooth components at final boosting step
par(mfrow=c(2,4))
plot(gb3)

#   plot smooth components for which the null line is not inside the bands
#   at 'optimal' boosting step (determined by AIC)
par(mfrow=c(1,length(selected$smoothbands)))
plot(gb3,select=selected$smoothbands,at.step=which.min(gb3$AIC))

##   Fit a generalized linear model for comparison

x.linear <- cbind(x,x.linear)
gb4 <- GAMBoost(x=NULL,y=y,x.linear=x.linear,penalty.linear=100,
                stepno=100,trace=TRUE,family=binomial())

#   Compare with generalized additive model fit
plot(0:100,gb3$AIC,type="l",xlab="stepno",ylab="AIC"); lines(0:100,gb4$AIC,lty=2)


##   Fit a generalized linear model with penalty modification
##   after every boosting step, with penalty changes being
##   redistrbuted via a connection matrix

pendistmat <- matrix(0,10,10)
#    Covariates 1 and 3 are connected
pendistmat[1,3] <- pendistmat[3,1] <- 1

gb5 <- GAMBoost(x=NULL,y=y,x.linear=x.linear,penalty.linear=100,
                stepsize.factor.linear=0.9,pendistmat.linear=pendistmat,
                stepno=100,trace=TRUE,family=binomial())

#   or alternatively

gb5 <- GAMBoost(x=NULL,y=y,x.linear=x.linear,penalty.linear=100,
                stepsize.factor.linear=0.9,
                pendistmat.linear=pendistmat[c(1,3),c(1,3)],
                connected.index.linear=c(1,3),
                stepno=100,trace=TRUE,family=binomial())




