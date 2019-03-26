library(mirt)


### Name: itemfit
### Title: Item fit statistics
### Aliases: itemfit
### Keywords: fit item

### ** Examples


## Not run: 
##D 
##D P <- function(Theta){exp(Theta^2 * 1.2 - 1) / (1 + exp(Theta^2 * 1.2 - 1))}
##D 
##D #make some data
##D set.seed(1234)
##D a <- matrix(rlnorm(20, meanlog=0, sdlog = .1),ncol=1)
##D d <- matrix(rnorm(20),ncol=1)
##D Theta <- matrix(rnorm(2000))
##D items <- rep('2PL', 20)
##D ps <- P(Theta)
##D baditem <- numeric(2000)
##D for(i in 1:2000)
##D    baditem[i] <- sample(c(0,1), 1, prob = c(1-ps[i], ps[i]))
##D data <- cbind(simdata(a,d, 2000, items, Theta=Theta), baditem=baditem)
##D 
##D x <- mirt(data, 1)
##D raschfit <- mirt(data, 1, itemtype='Rasch')
##D fit <- itemfit(x)
##D fit
##D 
##D itemfit(x)
##D itemfit(x, 'X2') # just X2
##D itemfit(x, c('S_X2', 'X2')) #both S_X2 and X2
##D itemfit(x, group.bins=15, empirical.plot = 1) #empirical item plot with 15 points
##D itemfit(x, group.bins=15, empirical.plot = 21)
##D 
##D # PV and X2* statistics (parametric bootstrap stats not run to save time)
##D itemfit(x, 'PV_Q1')
##D 
##D # mirtCluster() # improve speed of bootstrap samples by running in parallel
##D # itemfit(x, 'PV_Q1*')
##D # itemfit(x, 'X2*') # Stone's 1993 statistic
##D # itemfit(x, 'X2*_df') # Stone's 2000 scaled statistic with df estimate
##D 
##D #empirical tables
##D itemfit(x, empirical.table=1)
##D itemfit(x, empirical.table=21)
##D 
##D #infit/outfit statistics. method='ML' agrees better with eRm package
##D itemfit(raschfit, 'infit', method = 'ML') #infit and outfit stats
##D 
##D #same as above, but inputting ML estimates instead
##D Theta <- fscores(raschfit, method = 'ML')
##D itemfit(raschfit, 'infit', Theta=Theta)
##D 
##D # fit a new more flexible model for the mis-fitting item
##D itemtype <- c(rep('2PL', 20), 'spline')
##D x2 <- mirt(data, 1, itemtype=itemtype)
##D itemfit(x2)
##D itemplot(x2, 21)
##D anova(x2, x)
##D 
##D #------------------------------------------------------------
##D 
##D #similar example to Kang and Chen 2007
##D a <- matrix(c(.8,.4,.7, .8, .4, .7, 1, 1, 1, 1))
##D d <- matrix(rep(c(2.0,0.0,-1,-1.5),10), ncol=4, byrow=TRUE)
##D dat <- simdata(a,d,2000, itemtype = rep('graded', 10))
##D head(dat)
##D 
##D mod <- mirt(dat, 1)
##D itemfit(mod)
##D itemfit(mod, 'X2') #pretty much useless given inflated Type I error rates
##D itemfit(mod, empirical.plot = 1)
##D 
##D # collapsed tables (see mincell.X2) for X2 and G2
##D itemfit(mod, empirical.table = 1)
##D 
##D mod2 <- mirt(dat, 1, 'Rasch')
##D itemfit(mod2, 'infit')
##D 
##D #massive list of tables
##D tables <- itemfit(mod, S_X2.tables = TRUE)
##D 
##D #observed and expected total score patterns for item 1 (post collapsing)
##D tables$O[[1]]
##D tables$E[[1]]
##D 
##D # fit stats with missing data (run in parallel using all cores)
##D data[sample(1:prod(dim(data)), 500)] <- NA
##D raschfit <- mirt(data, 1, itemtype='Rasch')
##D 
##D # use imputation if the proportion of missing data is relatively small
##D mirtCluster() # run in parallel
##D itemfit(raschfit, c('S_X2', 'infit'), impute = 10)
##D 
##D #alternative route: use only valid data by removing rows with missing terms
##D itemfit(raschfit, c('S_X2', 'infit'), na.rm = TRUE)
##D 
##D # note that X2, G2, PV-Q1, and X2* do not require complete datasets
##D itemfit(raschfit, c('X2', 'G2'))
##D itemfit(raschfit, empirical.plot=1)
##D itemfit(raschfit, empirical.table=1)
##D 
## End(Not run)




