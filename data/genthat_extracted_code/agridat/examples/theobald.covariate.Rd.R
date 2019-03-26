library(agridat)


### Name: theobald.covariate
### Title: Multi-environment trial of corn silage, Year * Loc * Variety
###   with covariate
### Aliases: theobald.covariate

### ** Examples


data(theobald.covariate)
dat <- theobald.covariate
require(lattice)
xyplot(yield ~ chu|gen, dat, type=c('p','smooth'),
       xlab =  "chu = corn heat units",
       main="theobald.covariate - yield vs heat")

## Not run: 
##D   # REML estimates (Means) in table 3 of Theobald 2002
##D   require(lme4)
##D   dat <- transform(dat, year=factor(year))
##D   m0 <- lmer(yield ~ -1 + gen + (1|year/env) + (1|gen:year), data=dat)
##D   round(fixef(m0),2)
## End(Not run)

## Not run: 
##D 
##D # Use JAGS to fit Theobald (2002) model 3.2 with 'Expert' prior
##D 
##D require(reshape2)
##D ymat <- acast(dat, year+env~gen, value.var='yield')
##D chu <- acast(dat, year+env~., mean, value.var='chu', na.rm=TRUE)
##D chu <- as.vector(chu - mean(chu))  # Center the covariate
##D dat$yr <- as.numeric(dat$year)
##D yridx <- as.vector(acast(dat, year+env~., mean, value.var='yr', na.rm=TRUE))
##D dat$loc <- as.numeric(dat$env)
##D locidx <- acast(dat, year+env~., mean, value.var='loc', na.rm=TRUE)
##D locidx <- as.vector(locidx)
##D 
##D jdat <- list(nVar = 10, nYear = 5, nLoc = 7, nYL = 29, yield = ymat,
##D             chu = chu, year = yridx, loc = locidx)
##D 
##D require(rjags)
##D m1 <- jags.model(file=system.file(package="agridat", "files/theobald.covariate.jag"),
##D   data=jdat, n.chains=2)
##D 
##D # Table 3, Variety deviations from means (Expert prior)
##D c1 <- coda.samples(m1, variable.names=(c('alpha')),
##D                    n.iter=10000, thin=10)
##D s1 <- summary(c1)
##D effs <- s1$statistics[,'Mean']
##D rev(sort(round(effs - mean(effs), 2))) # Perfect match (different order?)
## End(Not run)




