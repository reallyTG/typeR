library(mirt)


### Name: mdirt
### Title: Multidimensional discrete item response theory
### Aliases: mdirt
### Keywords: models

### ** Examples


#LSAT6 dataset
dat <- expand.table(LSAT6)

# fit with 2-3 latent classes
(mod2 <- mdirt(dat, 2))
## Not run: 
##D (mod3 <- mdirt(dat, 3))
##D summary(mod2)
##D residuals(mod2)
##D residuals(mod2, type = 'exp')
##D anova(mod2, mod3)
##D M2(mod2)
##D itemfit(mod2)
##D 
##D # generate classification plots
##D plot(mod2)
##D plot(mod2, facet_items = FALSE)
##D plot(mod2, profile = TRUE)
##D 
##D # available for polytomous data
##D mod <- mdirt(Science, 2)
##D summary(mod)
##D plot(mod)
##D plot(mod, profile=TRUE)
##D 
##D # classification based on response patterns
##D fscores(mod2, full.scores = FALSE)
##D 
##D # classify individuals either with the largest posterior probability.....
##D fs <- fscores(mod2)
##D head(fs)
##D classes <- 1:2
##D class_max <- classes[apply(apply(fs, 1, max) == fs, 1, which)]
##D table(class_max)
##D 
##D # ... or by probability sampling (i.e., plausible value draws)
##D class_prob <- apply(fs, 1, function(x) sample(1:2, 1, prob=x))
##D table(class_prob)
##D 
##D # plausible value imputations for stochastic classification in both classes
##D pvs <- fscores(mod2, plausible.draws=10)
##D tabs <- lapply(pvs, function(x) apply(x, 2, table))
##D tabs[[1]]
##D 
##D 
##D # fit with random starting points (run in parallel to save time)
##D mirtCluster()
##D mod <- mdirt(dat, 2, nruns=10)
##D 
##D #--------------------------
##D # Grade of measurement model
##D 
##D # define a custom Theta grid for including a 'fuzzy' class membership
##D (Theta <- matrix(c(1, 0, .5, .5, 0, 1), nrow=3 , ncol=2, byrow=TRUE))
##D (mod_gom <- mdirt(dat, 2, customTheta = Theta))
##D summary(mod_gom)
##D 
##D #-----------------
##D # Multidimensional discrete latent class model
##D 
##D dat <- key2binary(SAT12,
##D      key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D 
##D # define Theta grid for three latent classes
##D (Theta <- thetaComb(0:1, 3))
##D (mod_discrete <- mdirt(dat, 3, customTheta = Theta))
##D summary(mod_discrete)
##D 
##D # Located latent class model
##D model <- mirt.model('C1 = 1-32
##D                      C2 = 1-32
##D                      C3 = 1-32
##D                      CONSTRAIN = (1-32, a1), (1-32, a2), (1-32, a3)')
##D (mod_located <- mdirt(dat, model, customTheta = diag(3)))
##D summary(mod_located)
##D 
##D #-----------------
##D ### DINA model example
##D # generate some suitable data for a two dimensional DINA application
##D #     (first columns are intercepts)
##D set.seed(1)
##D Theta <- expand.table(matrix(c(1,0,0,0, 200,
##D                                1,1,0,0, 200,
##D                                1,0,1,0, 100,
##D                                1,1,1,1, 500), 4, 5, byrow=TRUE))
##D a <- matrix(c(rnorm(15, -1.5, .5), rlnorm(5, .2, .3), numeric(15), rlnorm(5, .2, .3),
##D               numeric(15), rlnorm(5, .2, .3)), 15, 4)
##D 
##D guess <- plogis(a[11:15,1]) # population guess
##D slip <- 1 - plogis(rowSums(a[11:15,])) # population slip
##D 
##D dat <- simdata(a, Theta=Theta, itemtype = 'lca')
##D 
##D # first column is the intercept, 2nd and 3rd are attributes
##D theta <- cbind(1, thetaComb(0:1, 2))
##D theta <- cbind(theta, theta[,2] * theta[,3]) #DINA interaction of main attributes
##D model <- mirt.model('Intercept = 1-15
##D                      A1 = 1-5
##D                      A2 = 6-10
##D                      A1A2 = 11-15')
##D 
##D # last 5 items are DINA (first 10 are unidimensional C-RUMs)
##D DINA <- mdirt(dat, model, customTheta = theta)
##D coef(DINA, simplify=TRUE)
##D summary(DINA)
##D M2(DINA) # fits well (as it should)
##D 
##D cfs <- coef(DINA, simplify=TRUE)$items[11:15,]
##D cbind(guess, estguess = plogis(cfs[,1]))
##D cbind(slip, estslip = 1 - plogis(rowSums(cfs)))
##D 
##D 
##D ### DINO model example
##D theta <- cbind(1, thetaComb(0:1, 2))
##D # define theta matrix with negative interaction term
##D (theta <- cbind(theta, -theta[,2] * theta[,3]))
##D 
##D model <- mirt.model('Intercept = 1-15
##D                      A1 = 1-5, 11-15
##D                      A2 = 6-15
##D                      Yoshi = 11-15
##D                      CONSTRAIN = (11,a2,a3,a4), (12,a2,a3,a4), (13,a2,a3,a4),
##D                                  (14,a2,a3,a4), (15,a2,a3,a4)')
##D 
##D # last five items are DINOs (first 10 are unidimensional C-RUMs)
##D DINO <- mdirt(dat, model, customTheta = theta)
##D coef(DINO, simplify=TRUE)
##D summary(DINO)
##D M2(DINO) #doesn't fit as well, because not the generating model
##D 
##D ## C-RUM (analogous to MIRT model)
##D theta <- cbind(1, thetaComb(0:1, 2))
##D model <- mirt.model('Intercept = 1-15
##D                      A1 = 1-5, 11-15
##D                      A2 = 6-15')
##D 
##D CRUM <- mdirt(dat, model, customTheta = theta)
##D coef(CRUM, simplify=TRUE)
##D summary(CRUM)
##D 
##D # good fit, but over-saturated (main effects for items 11-15 can be set to 0)
##D M2(CRUM)
##D 
##D #------------------
##D #multidimensional latent class model
##D 
##D dat <- key2binary(SAT12,
##D      key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D 
##D # 5 latent classes within 2 different sets of items
##D model <- mirt.model('C1 = 1-16
##D                      C2 = 1-16
##D                      C3 = 1-16
##D                      C4 = 1-16
##D                      C5 = 1-16
##D                      C6 = 17-32
##D                      C7 = 17-32
##D                      C8 = 17-32
##D                      C9 = 17-32
##D                      C10 = 17-32
##D                      CONSTRAIN = (1-16, a1), (1-16, a2), (1-16, a3), (1-16, a4), (1-16, a5),
##D                        (17-32, a6), (17-32, a7), (17-32, a8), (17-32, a9), (17-32, a10)')
##D 
##D theta <- diag(10) # defined explicitly. Otherwise, this profile is assumed
##D mod <- mdirt(dat, model, customTheta = theta)
##D coef(mod, simplify=TRUE)
##D summary(mod)
##D 
##D #------------------
##D # multiple group with constrained group probabilities
##D  dat <- key2binary(SAT12,
##D    key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D group <- rep(c('G1', 'G2'), each = nrow(SAT12)/2)
##D Theta <- diag(2)
##D 
##D # the latent class parameters are technically located in the (nitems + 1) location
##D model <- mirt.model('A1 = 1-32
##D                      A2 = 1-32
##D                      CONSTRAINB = (33, c1)')
##D mod <- mdirt(dat, model, group = group, customTheta = Theta)
##D coef(mod, simplify=TRUE)
##D summary(mod)
##D 
##D 
## End(Not run)



