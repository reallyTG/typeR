library(poLCA)


### Name: poLCA.posterior
### Title: Posterior probabilities from a latent class model
### Aliases: poLCA.posterior
### Keywords: methods

### ** Examples

data(election)

## Basic latent class model with three classes
f1 <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,
            MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~1
lc1 <- poLCA(f1,election,nclass=3)  # log-likelihood: -16714.66

# The first observed case
lc1$y[1,]
lc1$posterior[1,]
poLCA.posterior(lc=lc1,y=as.numeric(lc1$y[1,]))

# A hypothetical case
poLCA.posterior(lc=lc1,y=rep(2,12))

# Entering y as a matrix
lc1$posterior[1:10,]
poLCA.posterior(lc=lc1,y=mapply(as.numeric,lc1$y[1:10,]))


## Latent class regression model with three classes
f2 <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,
            MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~AGE+EDUC+GENDER
lc2 <- poLCA(f2,election,nclass=3)  # log-likelihood: -16598.38

# Posteriors for case number 97 (poorly classified)
lc2$y[97,]
lc2$x[97,]
lc2$posterior[97,]
poLCA.posterior(lc=lc2,y=as.numeric(lc2$y[97,]),x=c(41,6,1))

# If x is not specified, the posterior is calculated using the population average
poLCA.posterior(lc=lc2,y=as.numeric(lc2$y[97,]))

# Entering y and x as matrices
round(lc2$posterior[95:100,],2)
round(poLCA.posterior(lc=lc2,y=mapply(as.numeric,lc2$y[95:100,]),
                             x=as.matrix(lc2$x[95:100,-1])),2)



