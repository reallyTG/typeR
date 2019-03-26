library(gcKrig)


### Name: mlegc
### Title: Maximum Likelihood Estimation in Gaussian Copula Models for
###   Geostatistical Count Data
### Aliases: mlegc
### Keywords: Estimation

### ** Examples

## Not run: 
##D ## Fit a Simulated Dataset with 100 locations
##D grid <- seq(0.05, 0.95, by = 0.1)
##D xloc <- expand.grid(x = grid, y = grid)[,1]
##D yloc <- expand.grid(x = grid, y = grid)[,2]
##D 
##D set.seed(123)
##D simData1 <- simgc(locs = cbind(xloc,yloc), sim.n = 1,
##D                     marginal = negbin.gc(mu = exp(1+xloc), od = 1),
##D                     corr = matern.gc(range = 0.4, kappa = 0.5, nugget = 0))
##D 
##D simFit1 <- mlegc(y = simData1$data, x = xloc, locs = cbind(xloc,yloc),
##D                  marginal = negbin.gc(link = 'log'),
##D                  corr = matern.gc(kappa = 0.5, nugget = FALSE), method = 'GHK')
##D 
##D simFit2 <- mlegc(y = simData1$data, x = xloc, locs = cbind(xloc,yloc),
##D                  marginal = negbin.gc(link = 'log'),
##D                  corr = matern.gc(kappa = 0.5, nugget = FALSE), method = 'GQT')
##D #summary(simFit1);summary(simFit2)
##D #plot(simFit1);plot(simFit2)
##D 
##D 
##D 
##D ## Time consuming examples
##D ## Fit a real dataset with 70 sampling locations.
##D data(Weed95)
##D weedobs <- Weed95[Weed95$dummy==1, ]
##D weedpred <- Weed95[Weed95$dummy==0, ]
##D Weedfit1 <- mlegc(y = weedobs$weedcount, x = weedobs[,4:5], locs = weedobs[,1:2],
##D                      marginal = poisson.gc(link='log'),
##D                      corr = matern.gc(kappa = 0.5, nugget = TRUE),
##D                      method = 'GHK')
##D summary(Weedfit1)
##D plot(Weedfit1)
##D 
##D 
##D ## Fit a real dataset with 256 locations
##D data(LansingTrees)
##D Treefit1 <- mlegc(y = LansingTrees[,3], x = LansingTrees[,4], locs = LansingTrees[,1:2],
##D                   marginal = negbin.gc(link = 'log'),
##D                   corr = matern.gc(kappa = 0.5, nugget = FALSE), method = 'GHK')
##D summary(Treefit1)
##D plot(Treefit1)
##D 
##D # Try to use GQT method
##D Treefit2<- mlegc(y = LansingTrees[,3], x = LansingTrees[,4],
##D                 locs = LansingTrees[,1:2], marginal = poisson.gc(link='log'),
##D                 corr = matern.gc(kappa = 0.5, nugget = TRUE), method = 'GQT')
##D summary(Treefit2)
##D plot(Treefit2)
##D 
##D ## Fit a real dataset with randomized locations
##D data(AtlanticFish)
##D Fitfish <- mlegc(y = AtlanticFish[,3], x = AtlanticFish[,4:6], locs = AtlanticFish[,1:2],
##D                    longlat = TRUE, marginal = negbin.gc(link='log'),
##D                    corr = matern.gc(kappa = 0.5, nugget = TRUE), method = 'GHK')
##D summary(Fitfish)
##D 
##D ## Fit a real dataset with binomial counts; see Masarotto and Varin (2016).
##D library(gcmr)
##D data(malaria)
##D malariax <- data.frame(netuse = malaria$netuse,
##D                        green = malaria$green/100,
##D                        phc = malaria$phc)
##D Fitmalaria <- mlegc(y = malaria$cases, x = malariax, locs = malaria[,1:2],
##D                     marginal = binomial.gc(link='logit'), corrpar0 = 1.5,
##D                     corr = matern.gc(kappa = 0.5, nugget = FALSE),
##D                     distscale = 0.001, effort = malaria$size, method = 'GHK')
##D summary(Fitmalaria)
##D 
##D 
##D ## Fit a real spatial binary dataset with 333 locations using probit link
##D data(OilWell)
##D Oilest1 <- mlegc(y = OilWell[,3], x = NULL, locs = OilWell[,1:2],
##D                  marginal = binomial.gc(link = 'probit'),
##D                  corr = matern.gc(nugget = TRUE), method = 'GHK')
##D summary(Oilest1)
##D plot(Oilest1, col = 2)
## End(Not run)







