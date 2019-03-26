library(mirt)


### Name: multipleGroup
### Title: Multiple Group Estimation
### Aliases: multipleGroup
### Keywords: models

### ** Examples

## Not run: 
##D 
##D #single factor
##D set.seed(12345)
##D a <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D itemtype <- rep('2PL', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D models <- 'F1 = 1-15'
##D 
##D mod_configural <- multipleGroup(dat, models, group = group) #completely separate analyses
##D #limited information fit statistics
##D M2(mod_configural)
##D 
##D mod_metric <- multipleGroup(dat, models, group = group, invariance=c('slopes')) #equal slopes
##D #equal intercepts, free variance and means
##D mod_scalar2 <- multipleGroup(dat, models, group = group,
##D                              invariance=c('slopes', 'intercepts', 'free_var','free_means'))
##D mod_scalar1 <- multipleGroup(dat, models, group = group,  #fixed means
##D                              invariance=c('slopes', 'intercepts', 'free_var'))
##D mod_fullconstrain <- multipleGroup(dat, models, group = group,
##D                              invariance=c('slopes', 'intercepts'))
##D extract.mirt(mod_fullconstrain, 'time') #time of estimation components
##D 
##D #optionally use Newton-Raphson for (generally) faster convergence in the M-step's
##D mod_fullconstrain <- multipleGroup(dat, models, group = group, optimizer = 'NR',
##D                              invariance=c('slopes', 'intercepts'))
##D extract.mirt(mod_fullconstrain, 'time') #time of estimation components
##D 
##D summary(mod_scalar2)
##D coef(mod_scalar2, simplify=TRUE)
##D residuals(mod_scalar2)
##D plot(mod_configural)
##D plot(mod_configural, type = 'info')
##D plot(mod_configural, type = 'trace')
##D plot(mod_configural, type = 'trace', which.items = 1:4)
##D itemplot(mod_configural, 2)
##D itemplot(mod_configural, 2, type = 'RE')
##D 
##D anova(mod_metric, mod_configural) #equal slopes only
##D anova(mod_scalar2, mod_metric) #equal intercepts, free variance and mean
##D anova(mod_scalar1, mod_scalar2) #fix mean
##D anova(mod_fullconstrain, mod_scalar1) #fix variance
##D 
##D 
##D #test whether first 6 slopes should be equal across groups
##D values <- multipleGroup(dat, models, group = group, pars = 'values')
##D values
##D constrain <- list(c(1, 63), c(5,67), c(9,71), c(13,75), c(17,79), c(21,83))
##D equalslopes <- multipleGroup(dat, models, group = group, constrain = constrain)
##D anova(equalslopes, mod_configural)
##D 
##D #same as above, but using mirt.model syntax
##D newmodel <- '
##D     F = 1-15
##D     CONSTRAINB = (1-6, a1)'
##D equalslopes <- multipleGroup(dat, newmodel, group = group)
##D coef(equalslopes, simplify=TRUE)
##D 
##D ############
##D # vertical scaling (i.e., equating when groups answer items others do not)
##D dat2 <- dat
##D dat2[group == 'D1', 1:2] <- dat2[group != 'D1', 14:15] <- NA
##D head(dat2)
##D tail(dat2)
##D 
##D # items with missing responses need to be constrained across groups for identification
##D nms <- colnames(dat2)
##D mod <- multipleGroup(dat2, 1, group, invariance = nms[c(1:2, 14:15)])
##D 
##D # this will throw an error without proper constraints (SEs cannot be computed either)
##D # mod <- multipleGroup(dat2, 1, group)
##D 
##D # model still does not have anchors, therefore need to add a few (here use items 3-5)
##D mod_anchor <- multipleGroup(dat2, 1, group,
##D                             invariance = c(nms[c(1:5, 14:15)], 'free_means', 'free_var'))
##D coef(mod_anchor, simplify=TRUE)
##D 
##D # check if identified by computing information matrix
##D mod_anchor <- multipleGroup(dat2, 1, group, pars = mod2values(mod_anchor), TOL=NaN, SE=TRUE,
##D                             invariance = c(nms[c(1:5, 14:15)], 'free_means', 'free_var'))
##D mod_anchor
##D coef(mod_anchor)
##D coef(mod_anchor, printSE=TRUE)
##D 
##D 
##D #############
##D #DIF test for each item (using all other items as anchors)
##D itemnames <- colnames(dat)
##D refmodel <- multipleGroup(dat, models, group = group, SE=TRUE,
##D                              invariance=c('free_means', 'free_var', itemnames))
##D 
##D #loop over items (in practice, run in parallel to increase speed). May be better to use ?DIF
##D estmodels <- vector('list', ncol(dat))
##D for(i in 1:ncol(dat))
##D     estmodels[[i]] <- multipleGroup(dat, models, group = group, verbose = FALSE, calcNull=FALSE,
##D                              invariance=c('free_means', 'free_var', itemnames[-i]))
##D 
##D (anovas <- lapply(estmodels, anova, object2=refmodel, verbose=FALSE))
##D 
##D #family-wise error control
##D p <- do.call(rbind, lapply(anovas, function(x) x[2, 'p']))
##D p.adjust(p, method = 'BH')
##D 
##D #same as above, except only test if slopes vary (1 df)
##D #constrain all intercepts
##D estmodels <- vector('list', ncol(dat))
##D for(i in 1:ncol(dat))
##D     estmodels[[i]] <- multipleGroup(dat, models, group = group, verbose = FALSE, calcNull=FALSE,
##D                              invariance=c('free_means', 'free_var', 'intercepts',
##D                              itemnames[-i]))
##D 
##D (anovas <- lapply(estmodels, anova, object2=refmodel, verbose=FALSE))
##D 
##D #quickly test with Wald test using DIF()
##D mod_configural2 <- multipleGroup(dat, models, group = group, SE=TRUE)
##D DIF(mod_configural2, which.par = c('a1', 'd'), Wald=TRUE, p.adjust = 'fdr')
##D 
##D #############
##D #multiple factors
##D 
##D a <- matrix(c(abs(rnorm(5,1,.3)), rep(0,15),abs(rnorm(5,1,.3)),
##D      rep(0,15),abs(rnorm(5,1,.3))), 15, 3)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D mu <- c(-.4, -.7, .1)
##D sigma <- matrix(c(1.21,.297,1.232,.297,.81,.252,1.232,.252,1.96),3,3)
##D itemtype <- rep('2PL', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, mu = mu, sigma = sigma)
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D 
##D #group models
##D model <- '
##D    F1 = 1-5
##D    F2 = 6-10
##D    F3 = 11-15'
##D 
##D #define mirt cluster to use parallel architecture
##D mirtCluster()
##D 
##D #EM approach (not as accurate with 3 factors, but generally good for quick model comparisons)
##D mod_configural <- multipleGroup(dat, model, group = group) #completely separate analyses
##D mod_metric <- multipleGroup(dat, model, group = group, invariance=c('slopes')) #equal slopes
##D mod_fullconstrain <- multipleGroup(dat, model, group = group, #equal means, slopes, intercepts
##D                              invariance=c('slopes', 'intercepts'))
##D 
##D anova(mod_metric, mod_configural)
##D anova(mod_fullconstrain, mod_metric)
##D 
##D #same as above, but with MHRM (generally  more accurate with 3+ factors, but slower)
##D mod_configural <- multipleGroup(dat, model, group = group, method = 'MHRM')
##D mod_metric <- multipleGroup(dat, model, group = group, invariance=c('slopes'), method = 'MHRM')
##D mod_fullconstrain <- multipleGroup(dat, model, group = group, method = 'MHRM',
##D                              invariance=c('slopes', 'intercepts'))
##D 
##D anova(mod_metric, mod_configural)
##D anova(mod_fullconstrain, mod_metric)
##D 
##D ############
##D #polytomous item example
##D set.seed(12345)
##D a <- matrix(abs(rnorm(15,1,.3)), ncol=1)
##D d <- matrix(rnorm(15,0,.7),ncol=1)
##D d <- cbind(d, d-1, d-2)
##D itemtype <- rep('graded', nrow(a))
##D N <- 1000
##D dataset1 <- simdata(a, d, N, itemtype)
##D dataset2 <- simdata(a, d, N, itemtype, mu = .1, sigma = matrix(1.5))
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep('D1', N), rep('D2', N))
##D model <- 'F1 = 1-15'
##D 
##D mod_configural <- multipleGroup(dat, model, group = group)
##D plot(mod_configural)
##D plot(mod_configural, type = 'SE')
##D itemplot(mod_configural, 1)
##D itemplot(mod_configural, 1, type = 'info')
##D plot(mod_configural, type = 'trace') # messy, score function typically better
##D plot(mod_configural, type = 'itemscore')
##D 
##D fs <- fscores(mod_configural, full.scores = FALSE)
##D head(fs[["D1"]])
##D fscores(mod_configural, method = 'EAPsum', full.scores = FALSE)
##D 
##D # constrain slopes within each group to be equal (but not across groups)
##D model2 <- 'F1 = 1-15
##D            CONSTRAIN = (1-15, a1)'
##D mod_configural2 <- multipleGroup(dat, model2, group = group)
##D plot(mod_configural2, type = 'SE')
##D plot(mod_configural2, type = 'RE')
##D itemplot(mod_configural2, 10)
##D 
##D ############
##D ## empirical histogram example (normal and bimodal groups)
##D set.seed(1234)
##D a <- matrix(rlnorm(50, .2, .2))
##D d <- matrix(rnorm(50))
##D ThetaNormal <- matrix(rnorm(2000))
##D ThetaBimodal <- scale(matrix(c(rnorm(1000, -2), rnorm(1000,2)))) #bimodal
##D Theta <- rbind(ThetaNormal, ThetaBimodal)
##D dat <- simdata(a, d, 4000, itemtype = '2PL', Theta=Theta)
##D group <- rep(c('G1', 'G2'), each=2000)
##D 
##D EH <- multipleGroup(dat, 1, group=group, dentype="empiricalhist", invariance = colnames(dat))
##D coef(EH, simplify=TRUE)
##D plot(EH, type = 'empiricalhist', npts = 60)
##D 
##D #DIF test for item 1
##D EH1 <- multipleGroup(dat, 1, group=group, dentype="empiricalhist", invariance = colnames(dat)[-1])
##D anova(EH, EH1)
##D 
##D #--------------------------------
##D # Mixture model (no prior group variable specified)
##D 
##D set.seed(12345)
##D nitems <- 20
##D a1 <- matrix(.75, ncol=1, nrow=nitems)
##D a2 <- matrix(1.25, ncol=1, nrow=nitems)
##D d1 <- matrix(rnorm(nitems,0,1),ncol=1)
##D d2 <- matrix(rnorm(nitems,0,1),ncol=1)
##D itemtype <- rep('2PL', nrow(a1))
##D N1 <- 500
##D N2 <- N1*2 # second class twice as large
##D 
##D dataset1 <- simdata(a1, d1, N1, itemtype)
##D dataset2 <- simdata(a2, d2, N2, itemtype)
##D dat <- rbind(dataset1, dataset2)
##D # group <- c(rep('D1', N1), rep('D2', N2))
##D 
##D # Mixture Rasch model (Rost, 1990)
##D models <- 'F1 = 1-20
##D            CONSTRAIN = (1-20, a1)'
##D mod_mix <- multipleGroup(dat, models, dentype = 'mixture-2', GenRandomPars = TRUE)
##D coef(mod_mix, simplify=TRUE)
##D summary(mod_mix)
##D plot(mod_mix)
##D plot(mod_mix, type = 'trace')
##D itemplot(mod_mix, 1, type = 'info')
##D 
##D head(fscores(mod_mix)) # theta estimates
##D head(fscores(mod_mix, method = 'classify')) # classification probability
##D itemfit(mod_mix)
##D 
##D # Mixture 2PL model
##D mod_mix2 <- multipleGroup(dat, 1, dentype = 'mixture-2', GenRandomPars = TRUE)
##D anova(mod_mix2, mod_mix)
##D coef(mod_mix2, simplify=TRUE)
##D itemfit(mod_mix2)
##D 
##D # Zero-inflated 2PL IRT model
##D model <- "F = 1-20
##D           START [MIXTURE_1] = (GROUP, MEAN_1, -100), (GROUP, COV_11, .00001),
##D              (1-20, a1, 1.0), (1-20, d, 0.0)
##D           FIXED [MIXTURE_1] = (GROUP, MEAN_1), (GROUP, COV_11),
##D              (1-20, a1), (1-20, d)"
##D zip <- multipleGroup(dat, model, dentype = 'mixture-2')
##D coef(zip, simplify=TRUE)
##D 
## End(Not run)



