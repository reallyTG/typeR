library(mirt)


### Name: mirt
### Title: Full-Information Item Factor Analysis (Multidimensional Item
###   Response Theory)
### Aliases: mirt
### Keywords: models

### ** Examples


#load LSAT section 7 data and compute 1 and 2 factor models
data <- expand.table(LSAT7)

(mod1 <- mirt(data, 1))
coef(mod1)
summary(mod1)
plot(mod1)
plot(mod1, type = 'trace')

## Not run: 
##D (mod2 <- mirt(data, 1, SE = TRUE)) #standard errors via the Oakes method
##D (mod2 <- mirt(data, 1, SE = TRUE, SE.type = 'SEM')) #standard errors with SEM method
##D coef(mod2)
##D (mod3 <- mirt(data, 1, SE = TRUE, SE.type = 'Richardson')) #with numerical Richardson method
##D residuals(mod1)
##D plot(mod1) #test score function
##D plot(mod1, type = 'trace') #trace lines
##D plot(mod2, type = 'info') #test information
##D plot(mod2, MI=200) #expected total score with 95% confidence intervals
##D 
##D #estimated 3PL model for item 5 only
##D (mod1.3PL <- mirt(data, 1, itemtype = c('2PL', '2PL', '2PL', '2PL', '3PL')))
##D coef(mod1.3PL)
##D 
##D #internally g and u pars are stored as logits, so usually a good idea to include normal prior
##D #  to help stabilize the parameters. For a value around .182 use a mean
##D #  of -1.5 (since 1 / (1 + exp(-(-1.5))) == .182)
##D model <- 'F = 1-5
##D          PRIOR = (5, g, norm, -1.5, 3)'
##D mod1.3PL.norm <- mirt(data, model, itemtype = c('2PL', '2PL', '2PL', '2PL', '3PL'))
##D coef(mod1.3PL.norm)
##D #limited information fit statistics
##D M2(mod1.3PL.norm)
##D 
##D #unidimensional ideal point model
##D idealpt <- mirt(data, 1, itemtype = 'ideal')
##D plot(idealpt, type = 'trace', facet_items = TRUE)
##D plot(idealpt, type = 'trace', facet_items = FALSE)
##D 
##D #two factors (exploratory)
##D mod2 <- mirt(data, 2)
##D coef(mod2)
##D summary(mod2, rotate = 'oblimin') #oblimin rotation
##D residuals(mod2)
##D plot(mod2)
##D plot(mod2, rotate = 'oblimin')
##D 
##D anova(mod1, mod2) #compare the two models
##D scoresfull <- fscores(mod2) #factor scores for each response pattern
##D head(scoresfull)
##D scorestable <- fscores(mod2, full.scores = FALSE) #save factor score table
##D head(scorestable)
##D 
##D #confirmatory (as an example, model is not identified since you need 3 items per factor)
##D # Two ways to define a confirmatory model: with mirt.model, or with a string
##D 
##D # these model definitions are equivalent
##D cmodel <- mirt.model('
##D    F1 = 1,4,5
##D    F2 = 2,3')
##D cmodel2 <- 'F1 = 1,4,5
##D             F2 = 2,3'
##D 
##D cmod <- mirt(data, cmodel)
##D # cmod <- mirt(data, cmodel2) # same as above
##D coef(cmod)
##D anova(cmod, mod2)
##D #check if identified by computing information matrix
##D (cmod <- mirt(data, cmodel, SE = TRUE))
##D 
##D ###########
##D #data from the 'ltm' package in numeric format
##D pmod1 <- mirt(Science, 1)
##D plot(pmod1)
##D plot(pmod1, type = 'trace')
##D plot(pmod1, type = 'itemscore')
##D summary(pmod1)
##D 
##D #Constrain all slopes to be equal with the constrain = list() input or mirt.model() syntax
##D #first obtain parameter index
##D values <- mirt(Science,1, pars = 'values')
##D values #note that slopes are numbered 1,5,9,13, or index with values$parnum[values$name == 'a1']
##D (pmod1_equalslopes <- mirt(Science, 1, constrain = list(c(1,5,9,13))))
##D coef(pmod1_equalslopes)
##D 
##D # using mirt.model syntax, constrain all item slopes to be equal
##D model <- 'F = 1-4
##D           CONSTRAIN = (1-4, a1)'
##D (pmod1_equalslopes <- mirt(Science, model))
##D coef(pmod1_equalslopes)
##D 
##D coef(pmod1_equalslopes)
##D anova(pmod1_equalslopes, pmod1) #significantly worse fit with almost all criteria
##D 
##D pmod2 <- mirt(Science, 2)
##D summary(pmod2)
##D plot(pmod2, rotate = 'oblimin')
##D itemplot(pmod2, 1, rotate = 'oblimin')
##D anova(pmod1, pmod2)
##D 
##D #unidimensional fit with a generalized partial credit and nominal model
##D (gpcmod <- mirt(Science, 1, 'gpcm'))
##D coef(gpcmod)
##D 
##D #for the nominal model the lowest and highest categories are assumed to be the
##D #  theoretically lowest and highest categories that related to the latent trait(s)
##D (nomod <- mirt(Science, 1, 'nominal'))
##D coef(nomod) #ordering of ak values suggest that the items are indeed ordinal
##D anova(gpcmod, nomod)
##D itemplot(nomod, 3)
##D 
##D #generalized graded unfolding model
##D (ggum <- mirt(Science, 1, 'ggum'))
##D coef(ggum, simplify=TRUE)
##D plot(ggum)
##D plot(ggum, type = 'trace')
##D plot(ggum, type = 'itemscore')
##D 
##D #monotonic polyomial models
##D (monopoly <- mirt(Science, 1, 'monopoly'))
##D coef(monopoly, simplify=TRUE)
##D plot(monopoly)
##D plot(monopoly, type = 'trace')
##D plot(monopoly, type = 'itemscore')
##D 
##D ## example applying survey weights.
##D # weight the first half of the cases to be more representative of population
##D survey.weights <- c(rep(2, nrow(Science)/2), rep(1, nrow(Science)/2))
##D survey.weights <- survey.weights/sum(survey.weights) * nrow(Science)
##D unweighted <- mirt(Science, 1)
##D weighted <- mirt(Science, 1, survey.weights=survey.weights)
##D 
##D ###########
##D #empirical dimensionality testing that includes 'guessing'
##D 
##D data(SAT12)
##D data <- key2binary(SAT12,
##D   key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D 
##D mod1 <- mirt(data, 1)
##D extract.mirt(mod1, 'time') #time elapsed for each estimation component
##D 
##D #optionally use Newton-Raphson for (generally) faster convergence in the M-step's
##D mod1 <- mirt(data, 1, optimizer = 'NR')
##D extract.mirt(mod1, 'time')
##D 
##D mod2 <- mirt(data, 2, optimizer = 'NR')
##D #difficulty converging with reduced quadpts, reduce TOL
##D mod3 <- mirt(data, 3, TOL = .001, optimizer = 'NR')
##D anova(mod1,mod2)
##D anova(mod2, mod3) #negative AIC, 2 factors probably best
##D 
##D #same as above, but using the QMCEM method for generally better accuracy in mod3
##D mod3 <- mirt(data, 3, method = 'QMCEM', TOL = .001, optimizer = 'NR')
##D anova(mod2, mod3)
##D 
##D #with fixed guessing parameters
##D mod1g <- mirt(data, 1, guess = .1)
##D coef(mod1g)
##D 
##D ###########
##D #graded rating scale example
##D 
##D #make some data
##D set.seed(1234)
##D a <- matrix(rep(1, 10))
##D d <- matrix(c(1,0.5,-.5,-1), 10, 4, byrow = TRUE)
##D c <- seq(-1, 1, length.out=10)
##D data <- simdata(a, d + c, 2000, itemtype = rep('graded',10))
##D 
##D mod1 <- mirt(data, 1)
##D mod2 <- mirt(data, 1, itemtype = 'grsm')
##D coef(mod2)
##D anova(mod2, mod1) #not sig, mod2 should be preferred
##D itemplot(mod2, 1)
##D itemplot(mod2, 5)
##D itemplot(mod2, 10)
##D 
##D ###########
##D # 2PL nominal response model example (Suh and Bolt, 2010)
##D data(SAT12)
##D SAT12[SAT12 == 8] <- NA #set 8 as a missing value
##D head(SAT12)
##D 
##D #correct answer key
##D key <- c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5)
##D scoredSAT12 <- key2binary(SAT12, key)
##D mod0 <- mirt(scoredSAT12, 1)
##D 
##D #for first 5 items use 2PLNRM and nominal
##D scoredSAT12[,1:5] <- as.matrix(SAT12[,1:5])
##D mod1 <- mirt(scoredSAT12, 1, c(rep('nominal',5),rep('2PL', 27)))
##D mod2 <- mirt(scoredSAT12, 1, c(rep('2PLNRM',5),rep('2PL', 27)), key=key)
##D coef(mod0)$Item.1
##D coef(mod1)$Item.1
##D coef(mod2)$Item.1
##D itemplot(mod0, 1)
##D itemplot(mod1, 1)
##D itemplot(mod2, 1)
##D 
##D #compare added information from distractors
##D Theta <- matrix(seq(-4,4,.01))
##D par(mfrow = c(2,3))
##D for(i in 1:5){
##D     info <- iteminfo(extract.item(mod0,i), Theta)
##D     info2 <- iteminfo(extract.item(mod2,i), Theta)
##D     plot(Theta, info2, type = 'l', main = paste('Information for item', i), ylab = 'Information')
##D     lines(Theta, info, col = 'red')
##D }
##D par(mfrow = c(1,1))
##D 
##D #test information
##D plot(Theta, testinfo(mod2, Theta), type = 'l', main = 'Test information', ylab = 'Information')
##D lines(Theta, testinfo(mod0, Theta), col = 'red')
##D 
##D ###########
##D # using the MH-RM algorithm
##D data(LSAT7)
##D fulldata <- expand.table(LSAT7)
##D (mod1 <- mirt(fulldata, 1, method = 'MHRM'))
##D 
##D #Confirmatory models
##D 
##D #simulate data
##D a <- matrix(c(
##D 1.5,NA,
##D 0.5,NA,
##D 1.0,NA,
##D 1.0,0.5,
##D  NA,1.5,
##D  NA,0.5,
##D  NA,1.0,
##D  NA,1.0),ncol=2,byrow=TRUE)
##D 
##D d <- matrix(c(
##D -1.0,NA,NA,
##D -1.5,NA,NA,
##D  1.5,NA,NA,
##D  0.0,NA,NA,
##D 3.0,2.0,-0.5,
##D 2.5,1.0,-1,
##D 2.0,0.0,NA,
##D 1.0,NA,NA),ncol=3,byrow=TRUE)
##D 
##D sigma <- diag(2)
##D sigma[1,2] <- sigma[2,1] <- .4
##D items <- c(rep('2PL',4), rep('graded',3), '2PL')
##D dataset <- simdata(a,d,2000,items,sigma)
##D 
##D #analyses
##D #CIFA for 2 factor crossed structure
##D 
##D model.1 <- '
##D   F1 = 1-4
##D   F2 = 4-8
##D   COV = F1*F2'
##D 
##D #compute model, and use parallel computation of the log-likelihood
##D mirtCluster()
##D mod1 <- mirt(dataset, model.1, method = 'MHRM')
##D coef(mod1)
##D summary(mod1)
##D residuals(mod1)
##D 
##D #####
##D #bifactor
##D model.3 <- '
##D   G = 1-8
##D   F1 = 1-4
##D   F2 = 5-8'
##D 
##D mod3 <- mirt(dataset,model.3, method = 'MHRM')
##D coef(mod3)
##D summary(mod3)
##D residuals(mod3)
##D anova(mod1,mod3)
##D 
##D #####
##D #polynomial/combinations
##D data(SAT12)
##D data <- key2binary(SAT12,
##D                   key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D 
##D model.quad <- '
##D        F1 = 1-32
##D   (F1*F1) = 1-32'
##D 
##D 
##D model.combo <- '
##D        F1 = 1-16
##D        F2 = 17-32
##D   (F1*F2) = 1-8'
##D 
##D (mod.quad <- mirt(data, model.quad))
##D summary(mod.quad)
##D (mod.combo <- mirt(data, model.combo))
##D anova(mod.quad, mod.combo)
##D 
##D #non-linear item and test plots
##D plot(mod.quad)
##D plot(mod.combo, type = 'SE')
##D itemplot(mod.quad, 1, type = 'score')
##D itemplot(mod.combo, 2, type = 'score')
##D itemplot(mod.combo, 2, type = 'infocontour')
##D 
##D ## empirical histogram examples (normal, skew and bimodality)
##D #make some data
##D set.seed(1234)
##D a <- matrix(rlnorm(50, .2, .2))
##D d <- matrix(rnorm(50))
##D ThetaNormal <- matrix(rnorm(2000))
##D ThetaBimodal <- scale(matrix(c(rnorm(1000, -2), rnorm(1000,2)))) #bimodal
##D ThetaSkew <- scale(matrix(rchisq(2000, 3))) #positive skew
##D datNormal <- simdata(a, d, 2000, itemtype = '2PL', Theta=ThetaNormal)
##D datBimodal <- simdata(a, d, 2000, itemtype = '2PL', Theta=ThetaBimodal)
##D datSkew <- simdata(a, d, 2000, itemtype = '2PL', Theta=ThetaSkew)
##D 
##D normal <- mirt(datNormal, 1, dentype = "empiricalhist")
##D plot(normal, type = 'empiricalhist')
##D histogram(ThetaNormal, breaks=30)
##D 
##D bimodal <- mirt(datBimodal, 1, dentype = "empiricalhist")
##D plot(bimodal, type = 'empiricalhist')
##D histogram(ThetaBimodal, breaks=30)
##D 
##D skew <- mirt(datSkew, 1, dentype = "empiricalhist")
##D plot(skew, type = 'empiricalhist')
##D histogram(ThetaSkew, breaks=30)
##D 
##D #####
##D # non-linear parameter constraints with Rsolnp package (nloptr supported as well):
##D # Find Rasch model subject to the constraint that the intercepts sum to 0
##D 
##D dat <- expand.table(LSAT6)
##D 
##D #free latent mean and variance terms
##D model <- 'Theta = 1-5
##D           MEAN = Theta
##D           COV = Theta*Theta'
##D 
##D #view how vector of parameters is organized internally
##D sv <- mirt(dat, model, itemtype = 'Rasch', pars = 'values')
##D sv[sv$est, ]
##D 
##D #constraint: create function for solnp to compute constraint, and declare value in eqB
##D eqfun <- function(p, optim_args) sum(p[1:5]) #could use browser() here, if it helps
##D LB <- c(rep(-15, 6), 1e-4) # more reasonable lower bound for variance term
##D 
##D mod <- mirt(dat, model, sv=sv, itemtype = 'Rasch', optimizer = 'solnp',
##D    solnp_args=list(eqfun=eqfun, eqB=0, LB=LB))
##D print(mod)
##D coef(mod)
##D (ds <- sapply(coef(mod)[1:5], function(x) x[,'d']))
##D sum(ds)
##D 
##D # same likelihood location as: mirt(dat, 1, itemtype = 'Rasch')
##D 
##D 
##D #######
##D # latent regression Rasch model
##D 
##D #simulate data
##D set.seed(1234)
##D N <- 1000
##D 
##D # covariates
##D X1 <- rnorm(N); X2 <- rnorm(N)
##D covdata <- data.frame(X1, X2)
##D Theta <- matrix(0.5 * X1 + -1 * X2 + rnorm(N, sd = 0.5))
##D 
##D #items and response data
##D a <- matrix(1, 20); d <- matrix(rnorm(20))
##D dat <- simdata(a, d, 1000, itemtype = '2PL', Theta=Theta)
##D 
##D #unconditional Rasch model
##D mod0 <- mirt(dat, 1, 'Rasch')
##D 
##D #conditional model using X1 and X2 as predictors of Theta
##D mod1 <- mirt(dat, 1, 'Rasch', covdata=covdata, formula = ~ X1 + X2)
##D coef(mod1, simplify=TRUE)
##D anova(mod0, mod1)
##D 
##D #bootstrapped confidence intervals
##D boot.mirt(mod1, R=5)
##D 
##D #draw plausible values for secondary analyses
##D pv <- fscores(mod1, plausible.draws = 10)
##D pvmods <- lapply(pv, function(x, covdata) lm(x ~ covdata$X1 + covdata$X2),
##D                  covdata=covdata)
##D #population characteristics recovered well, and can be averaged over
##D so <- lapply(pvmods, summary)
##D so
##D 
##D # compute Rubin's multiple imputation average
##D par <- lapply(so, function(x) x$coefficients[, 'Estimate'])
##D SEpar <- lapply(so, function(x) x$coefficients[, 'Std. Error'])
##D averageMI(par, SEpar)
##D 
##D ############
##D # Example using Gauss-Hermite quadrature with custom input functions
##D 
##D library(fastGHQuad)
##D data(SAT12)
##D data <- key2binary(SAT12,
##D                    key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D GH <- gaussHermiteData(50)
##D Theta <- matrix(GH$x)
##D 
##D # This prior works for uni- and multi-dimensional models
##D prior <- function(Theta, Etable){
##D     P <- grid <- GH$w / sqrt(pi)
##D     if(ncol(Theta) > 1)
##D         for(i in 2:ncol(Theta))
##D             P <- expand.grid(P, grid)
##D      if(!is.vector(P)) P <- apply(P, 1, prod)
##D      P
##D }
##D 
##D GHmod1 <- mirt(data, 1, optimizer = 'NR',
##D               technical = list(customTheta = Theta, customPriorFun = prior))
##D coef(GHmod1, simplify=TRUE)
##D 
##D Theta2 <- as.matrix(expand.grid(Theta, Theta))
##D GHmod2 <- mirt(data, 2, optimizer = 'NR', TOL = .0002,
##D               technical = list(customTheta = Theta2, customPriorFun = prior))
##D summary(GHmod2, suppress=.2)
##D 
##D ############
##D # Davidian curve example
##D 
##D dat <- key2binary(SAT12,
##D                    key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D dav <- mirt(dat, 1, dentype = 'Davidian-4') # use four smoothing parameters
##D plot(dav, type = 'Davidian') # shape of latent trait distribution
##D coef(dav, simplify=TRUE)
##D 
##D fs <- fscores(dav) # assume normal prior
##D fs2 <- fscores(dav, use_dentype_estimate=TRUE) # use Davidian estimated prior shape
##D head(cbind(fs, fs2))
##D 
##D itemfit(dav) # assume normal prior
##D itemfit(dav, use_dentype_estimate=TRUE) # use Davidian estimated prior shape
##D 
## End(Not run)



