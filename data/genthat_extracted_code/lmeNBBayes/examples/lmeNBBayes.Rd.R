library(lmeNBBayes)


### Name: lmeNBBayes
### Title: Generate posterior samples from a flexible mixed effect negative
###   binomial regression model.
### Aliases: lmeNBBayes pointsgamma plotgamma plotbeta plotnbinom slim
###   plotGs newCat useSamp adjustPosDef colmeansd getM Nuniq repeatAsID
###   piM lnpara int.M E.KN
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D 
##D ## generate samples from DSMSB review 2
##D d <- getS.StatInMed(rev=2,iseed=1,dist="YZ",Scenario="full")
##D formula.fit <- Y ~ timeInt1:trtAss + timeInt2:trtAss
##D 
##D B <- 10000
##D burnin <- 1000
##D thin <- 2
##D fit <- lmeNBBayes(formula=formula.fit,data=d, ID=d$ID, 
##D                   B = B, burnin = burnin,  thin=thin)
##D ## The output can be printed out:
##D fit 
##D 
##D 
##D ## Now, compute the conditional probability index using the mean function of placebo patients.
##D ## We need to modify two things in output of lmeNBBayes.
##D ## 1st, change the formula so that it does not distinguish between treatment and placebo
##D fit$para$formula <- Y ~ timeInt1 + timeInt2
##D ## 2nd, disregard the coefficient that corresponds to the treated patients
##D fit$beta <- fit$beta[,-c(3,5)]
##D cpi <- index.batch.Bayes(data=d,labelnp=d$labelnp,ID=d$ID,
##D                          olmeNBB=fit,printFreq=10^7)
##D cpi 
##D 
##D ## finally access the accuracy of the CPI estimates in terms of RMSE
##D Npat <- length(unique(d$ID))
##D est <- cpi$condProbSummary[,1]
##D true <- d$probIndex[1:Npat]
##D sqrt( mean( ( est - true )^2 ,na.rm=TRUE) )
##D               
##D 
## End(Not run)






