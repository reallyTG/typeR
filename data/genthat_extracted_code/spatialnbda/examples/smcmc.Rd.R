library(spatialnbda)


### Name: smcmc
### Title: Performs spatial NBDA in a Bayesian context with an
###   environmental covariate
### Aliases: smcmc

### ** Examples

library(SocialNetworks)
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (formatteddata, its, pilot_tuner1, pilot_tuner2, pilot_tuner3, 
    start1, start2, start3) 
{
    TimeD = formatteddata[[1]][, 7]
    censored = formatteddata[[1]][, 6]
    Aij = formatteddata[[1]][, 8]
    NaiveD = formatteddata[[2]]
    spatcov = formatteddata[[1]][, 9]
    s0 = start1
    baseline_rate = lambda0 = start2
    environmental = beta0 = start3
    acceptcounter = 0
    Jumbo <- array(0, c(its, 3))
    newparam <- array(0.5, 3)
    CurrentParam <- array(0.5, 3)
    newparam[1] = (CurrentParam[1] <- s0)
    newparam[2] = (CurrentParam[2] <- lambda0)
    newparam[3] = (CurrentParam[3] <- beta0)
    updates <- function(CurrentParam, newparam) {
        GU3 <- runif(1, CurrentParam[1] - pilot_tuner1, CurrentParam[1] + 
            pilot_tuner1)
        proposal = c(GU3, CurrentParam[2:3])
        num <- CpS(proposal)[[1]]
        den <- CpS(CurrentParam)[[1]]
        acc <- exp(num - den)
        acceptr <- min(1, acc)
        r <- runif(1)
        newparam[1] <- ifelse((r <= acceptr), GU3, CurrentParam[1])
        return(newparam[1])
    }
    updatelambda <- function(CurrentParam, newparam) {
        GU3 <- runif(1, CurrentParam[2] - pilot_tuner2, CurrentParam[2] + 
            pilot_tuner2)
        proposal = c(CurrentParam[1], GU3, CurrentParam[3])
        num <- CpS(proposal)[[1]]
        den <- CpS(CurrentParam)[[1]]
        acc <- exp(num - den)
        acceptt <- min(1, acc)
        r <- runif(1)
        newparam[2] <- ifelse((r <= acceptt), GU3, CurrentParam[2])
        acceptcounter <- ifelse((r <= acceptt), 1, 0)
        list(newparam[2], acceptcounter)
    }
    updatecovariate <- function(CurrentParam, newparam) {
        GU3 <- runif(1, CurrentParam[3] - 5, CurrentParam[3] + 
            5)
        proposal = c(CurrentParam[1:2], GU3)
        num <- CpS(proposal)[[1]]
        den <- CpS(CurrentParam)[[1]]
        acc <- exp(num - den)
        acceptr <- min(1, acc)
        r <- runif(1)
        newparam[3] <- ifelse((r <= acceptr), GU3, CurrentParam[3])
        return(newparam[3])
    }
    CpS = function(parameterproposal) {
        baseline = exp(parameterproposal[2])
        social_rate = exp(parameterproposal[1])
        spatialC = exp(parameterproposal[2])
        hazard = baseline * exp(spatialC) + (social_rate) * Aij
        uncensored = 1 - censored
        log_likelihood_u = sum(log(hazard * exp(-hazard * TimeD)) * 
            uncensored) + sum(-hazard * TimeD * NaiveD)
        log_likelihood_c = sum(-hazard * censored)
        log_likelihood = log_likelihood_u + log_likelihood_c
        lambdaprior <- log(dunif(parameterproposal[2], -10, 10))
        sprior <- log(dunif(parameterproposal[1], -10, 10))
        sCprior <- log(dunif(parameterproposal[3], -10, 10))
        pzoid <- log_likelihood + lambdaprior + sprior + sCprior
        pzoid
    }
    for (t in 1:its) {
        CurrentParam[1] = Jumbo[t, 1] = updates(CurrentParam, 
            newparam)[[1]]
        CurrentParam[2] = Jumbo[t, 2] = updatelambda(CurrentParam, 
            newparam)[[1]]
        CurrentParam[3] = Jumbo[t, 3] = updatecovariate(CurrentParam, 
            newparam)[[1]]
    }
    burnin = its/10
    par(mfrow = c(2, 2))
    plot(Jumbo[burnin:its, 1], type = "l", col = "blue", ylab = "social effect", 
        main = "Trace plot for social effect, s' ", lwd = 2)
    plot(Jumbo[burnin:its, 2], type = "l", col = "red", ylab = "asocial effect", 
        main = "Trace plot for asocial effect, lambda0' ", lwd = 2)
    plot(Jumbo[burnin:its, 3], type = "l", col = "lightgoldenrod", 
        ylab = "asocial effect", main = "Trace plot for spatial effect, beta0' ", 
        lwd = 2)
    params = c(mean(Jumbo[burnin:its, 1]), mean(Jumbo[burnin:its, 
        2]), mean(Jumbo[burnin:its, 3]))
    creds = c(sd(Jumbo[burnin:its, 1]), sd(Jumbo[burnin:its, 
        2]), sd(Jumbo[burnin:its, 3]))
    mcmcresults = list(Jumbo, params, creds)
    mcmcresults
  }
  
#---------------------------------------------------------------
#  Run spatial NBDA to estimate the social and asocial parameters
#  s and lambda.
#  The associations for the social network in this example are calculated
#  using an interaction function that assumes each individual has
#  an area of interaction or zone of influence.
#---------------------------------------------------------------




data(papertimes)
data(papernests)
data(x)
data(y)
z = array(0,c(length(x[,1]),1))# setting up array for storing spatial covariate information

for(i in 1:70){   # simulating spatial covariate information
xx = x[,1][i]
yy = y[,1][i]
z[i] = (3*xx + 14*yy) * exp(2 * (.4*xx - 1)) 
}



Times = papertimes[,1]
Ids = papernests[,1]
Diffusions = rep(1,length(Times))
Groups = rep(1,length(Times))
Events = c(1:length(Times))
socialites = matrix(1,nrow=70,ncol=70)


plot(x[,1],y[,1],xlab="x",ylab="y",cex=2,pch=16,main="Point pattern of nest positions")



areas = calculate.areas(x[,1],y[,1],rep(0.05,70),1000)
spatialareas = areas
len = length(x[,1])

spatialnetwork = matrix(0,nrow=len,ncol=len)
for(i in 1:len){
  for(j in i:len){ 
    template = spatialareas[[i]][j]
    spatialnetwork[i,j] = spatialnetwork[j,i] = template
    #spatialareas[[i]]=NULL
    
  }
  
}


shape = FormatData(Times,spatialnetwork,Ids,Groups,Diffusions,Events,spatialnetwork,z)
ptm <- proc.time()
smcmc(shape,10000,5,1,1,-5,-6,-5)
proc.time() - ptm

  
  



