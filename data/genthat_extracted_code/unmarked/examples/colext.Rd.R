library(unmarked)


### Name: colext
### Title: Fit the dynamic occupancy model of MacKenzie et. al (2003)
### Aliases: colext
### Keywords: models

### ** Examples


# Fake data
R <- 4 # number of sites
J <- 3 # number of secondary sampling occasions
T <- 2 # number of primary periods

y <- matrix(c(
   1,1,0,  0,0,0,
   0,0,0,  0,0,0,
   1,1,1,  1,1,0,
   1,0,1,  0,0,1), nrow=R, ncol=J*T, byrow=TRUE)
y

site.covs <- data.frame(x1=1:4, x2=factor(c('A','B','A','B')))
site.covs

yearly.site.covs <- list(
   year = matrix(c(
      'year1', 'year2',
      'year1', 'year2',
      'year1', 'year2',
      'year1', 'year2'), nrow=R, ncol=T, byrow=TRUE)
      )
yearly.site.covs

obs.covs <- list(
   x4 = matrix(c(
      -1,0,1,  -1,1,1,
      -2,0,0,  0,0,2,
      -3,1,0,  1,1,2,
      0,0,0,   0,1,-1), nrow=R, ncol=J*T, byrow=TRUE),
   x5 = matrix(c(
      'a','b','c',  'a','b','c',
      'd','b','a',  'd','b','a',
      'a','a','c',  'd','b','a',
      'a','b','a',  'd','b','a'), nrow=R, ncol=J*T, byrow=TRUE))
obs.covs

umf <- unmarkedMultFrame(y=y, siteCovs=site.covs,
    yearlySiteCovs=yearly.site.covs, obsCovs=obs.covs,
    numPrimary=2)                  # organize data
umf                                # look at data
summary(umf)                       # summarize
fm <- colext(~1, ~1, ~1, ~1, umf)  # fit a model
fm



## Not run: 
##D # Real data
##D data(frogs)
##D umf <- formatMult(masspcru)
##D obsCovs(umf) <- scale(obsCovs(umf))
##D 
##D ## Use 1/4 of data just for run speed in example
##D umf <- umf[which((1:numSites(umf)) %% 4 == 0),]
##D 
##D ## constant transition rates
##D (fm <- colext(psiformula = ~ 1,
##D gammaformula = ~ 1,
##D epsilonformula = ~ 1,
##D pformula = ~ JulianDate + I(JulianDate^2), umf, control = list(trace=1, maxit=1e4)))
##D 
##D ## get the trajectory estimates
##D smoothed(fm)
##D projected(fm)
##D 
##D # Empirical Bayes estimates of number of sites occupied in each year
##D re <- ranef(fm)
##D modes <- colSums(bup(re, stat="mode"))
##D plot(1:7, modes, xlab="Year", ylab="Sites occupied", ylim=c(0, 70))
##D 
##D ## Find bootstrap standard errors for smoothed trajectory
##D fm <- nonparboot(fm, B = 100)  # This takes a while!
##D fm@smoothed.mean.bsse
##D 
##D ## try yearly transition rates
##D yearlySiteCovs(umf) <- data.frame(year = factor(rep(1:7, numSites(umf))))
##D (fm.yearly <- colext(psiformula = ~ 1,
##D gammaformula = ~ year,
##D epsilonformula = ~ year,
##D pformula = ~ JulianDate + I(JulianDate^2), umf,
##D 	control = list(trace=1, maxit=1e4)))
## End(Not run)




