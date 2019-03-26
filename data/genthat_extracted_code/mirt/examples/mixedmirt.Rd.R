library(mirt)


### Name: mixedmirt
### Title: Mixed effects modeling for MIRT models
### Aliases: mixedmirt

### ** Examples


## Not run: 
##D 
##D #make some data
##D set.seed(1234)
##D N <- 750
##D a <- matrix(rlnorm(10,.3,1),10,1)
##D d <- matrix(rnorm(10), 10)
##D Theta <- matrix(sort(rnorm(N)))
##D pseudoIQ <- Theta * 5 + 100  + rnorm(N, 0 , 5)
##D pseudoIQ <- (pseudoIQ - mean(pseudoIQ))/10  #rescale variable for numerical stability
##D group <- factor(rep(c('G1','G2','G3'), each = N/3))
##D data <- simdata(a,d,N, itemtype = rep('2PL',10), Theta=Theta)
##D covdata <- data.frame(group, pseudoIQ)
##D #use parallel computing
##D mirtCluster()
##D 
##D #specify IRT model
##D model <- 'Theta = 1-10'
##D 
##D #model with no person predictors
##D mod0 <- mirt(data, model, itemtype = 'Rasch')
##D 
##D #group as a fixed effect predictor (aka, uniform dif)
##D mod1 <- mixedmirt(data, covdata, model, fixed = ~ 0 + group + items)
##D anova(mod0, mod1)
##D summary(mod1)
##D coef(mod1)
##D 
##D #same model as above in lme4
##D wide <- data.frame(id=1:nrow(data),data,covdata)
##D long <- reshape2::melt(wide, id.vars = c('id', 'group', 'pseudoIQ'))
##D library(lme4)
##D lmod0 <- glmer(value ~ 0 + variable + (1|id), long, family = binomial)
##D lmod1 <- glmer(value ~ 0 + group + variable + (1|id), long, family = binomial)
##D anova(lmod0, lmod1)
##D 
##D #model using 2PL items instead of Rasch
##D mod1b <- mixedmirt(data, covdata, model, fixed = ~ 0 + group + items, itemtype = '2PL')
##D anova(mod1, mod1b) #better with 2PL models using all criteria (as expected, given simdata pars)
##D 
##D #continuous predictor with group
##D mod2 <- mixedmirt(data, covdata, model, fixed = ~ 0 + group + items + pseudoIQ)
##D summary(mod2)
##D anova(mod1b, mod2)
##D 
##D #view fixed design matrix with and without unique item level intercepts
##D withint <- mixedmirt(data, covdata, model, fixed = ~ 0 + items + group, return.design = TRUE)
##D withoutint <- mixedmirt(data, covdata, model, fixed = ~ 0 + group, return.design = TRUE)
##D 
##D #notice that in result above, the intercepts 'items1 to items 10' were reassigned to 'd'
##D head(withint$X)
##D tail(withint$X)
##D head(withoutint$X) #no intercepts design here to be reassigned into item intercepts
##D tail(withoutint$X)
##D 
##D ###################################################
##D ### random effects
##D #make the number of groups much larger
##D covdata$group <- factor(rep(paste0('G',1:50), each = N/50))
##D 
##D #random groups
##D rmod1 <- mixedmirt(data, covdata, 1, fixed = ~ 0 + items, random = ~ 1|group)
##D summary(rmod1)
##D coef(rmod1)
##D 
##D #random groups and random items
##D rmod2 <- mixedmirt(data, covdata, 1, random = list(~ 1|group, ~ 1|items))
##D summary(rmod2)
##D eff <- randef(rmod2) #estimate random effects
##D 
##D #random slopes with fixed intercepts (suppressed correlation)
##D rmod3 <- mixedmirt(data, covdata, 1, fixed = ~ 0 + items, random = ~ -1 + pseudoIQ|group)
##D summary(rmod3)
##D eff <- randef(rmod3)
##D str(eff)
##D 
##D ###################################################
##D ##LLTM, and 2PL version of LLTM
##D data(SAT12)
##D data <- key2binary(SAT12,
##D                    key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D model <- 'Theta = 1-32'
##D 
##D # Suppose that the first 16 items were suspected to be easier than the last 16 items,
##D #   and we wish to test this item structure hypothesis (more intercept designs are possible
##D #   by including more columns).
##D itemdesign <- data.frame(itemorder = factor(c(rep('easier', 16), rep('harder', 16))))
##D 
##D #notice that the 'fixed = ~ ... + items' argument is omitted
##D LLTM <- mixedmirt(data, model = model, fixed = ~ 0 + itemorder, itemdesign = itemdesign,
##D    SE = TRUE) # SE argument ensures that the information matrix is computed accurately
##D summary(LLTM)
##D coef(LLTM)
##D wald(LLTM)
##D L <- matrix(c(-1, 1, 0), 1)
##D wald(LLTM, L) #first half different from second
##D 
##D #compare to items with estimated slopes (2PL)
##D twoPL <- mixedmirt(data, model = model, fixed = ~ 0 + itemorder, itemtype = '2PL',
##D                    itemdesign = itemdesign)
##D #twoPL not mixing too well (AR should be between .2 and .5), decrease MHcand
##D twoPL <- mixedmirt(data, model = model, fixed = ~ 0 + itemorder, itemtype = '2PL',
##D                   itemdesign = itemdesign, technical = list(MHcand = 0.8))
##D anova(twoPL, LLTM) #much better fit
##D summary(twoPL)
##D coef(twoPL)
##D 
##D wald(twoPL)
##D L <- matrix(0, 1, 34)
##D L[1, 1] <- 1
##D L[1, 2] <- -1
##D wald(twoPL, L) #n.s., which is the correct conclusion. Rasch approach gave wrong inference
##D 
##D ##LLTM with item error term
##D LLTMwithError <- mixedmirt(data, model = model, fixed = ~ 0 + itemorder, random = ~ 1|items,
##D     itemdesign = itemdesign)
##D summary(LLTMwithError)
##D #large item level variance after itemorder is regressed; not a great predictor of item difficulty
##D coef(LLTMwithError)
##D 
##D ###################################################
##D ### Polytomous example
##D 
##D #make an arbitrary group difference
##D covdat <- data.frame(group = rep(c('m', 'f'), nrow(Science)/2))
##D 
##D #partial credit model
##D mod <- mixedmirt(Science, covdat, model=1, fixed = ~ 0 + group)
##D coef(mod)
##D 
##D #gpcm to estimate slopes
##D mod2 <- mixedmirt(Science, covdat, model=1, fixed = ~ 0 + group,
##D                  itemtype = 'gpcm')
##D summary(mod2)
##D anova(mod, mod2)
##D 
##D #graded model
##D mod3 <- mixedmirt(Science, covdat, model=1, fixed = ~ 0 + group,
##D                  itemtype = 'graded')
##D coef(mod3)
##D 
##D 
##D ###################################################
##D # latent regression with Rasch and 2PL models
##D 
##D set.seed(1)
##D n <- 300
##D a <- matrix(1, 10)
##D d <- matrix(rnorm(10))
##D Theta <- matrix(c(rnorm(n, 0), rnorm(n, 1), rnorm(n, 2)))
##D covdata <- data.frame(group=rep(c('g1','g2','g3'), each=n))
##D dat <- simdata(a, d, N=n*3, Theta=Theta, itemtype = '2PL')
##D 
##D #had we known the latent abilities, we could have computed the regression coefs
##D summary(lm(Theta ~ covdata$group))
##D 
##D #but all we have is observed test data. Latent regression helps to recover these coefs
##D #Rasch model approach (and mirt equivalent)
##D rmod0 <- mirt(dat, 1, 'Rasch') # unconditional
##D 
##D # these two models are equivalent
##D rmod1a <- mirt(dat, 1, 'Rasch', covdata = covdata, formula = ~ group)
##D rmod1b <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items + group)
##D anova(rmod0, rmod1b)
##D coef(rmod1a, simplify=TRUE)
##D summary(rmod1b)
##D 
##D # 2PL, requires different input to allow Theta variance to remain fixed
##D mod0 <- mirt(dat, 1) # unconditional
##D mod1a <- mirt(dat, 1, covdata = covdata, formula = ~ group, itemtype = '2PL')
##D mod1b <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items, lr.fixed = ~group, itemtype = '2PL')
##D anova(mod0, mod1b)
##D coef(mod1a)$lr.betas
##D summary(mod1b)
##D 
##D # specifying specific regression effects is accomplished by passing a list of formula
##D model <- 'F1 = 1-5
##D          F2 = 6-10'
##D covdata$contvar <- rnorm(nrow(covdata))
##D mod2 <- mirt(dat, model, itemtype = 'Rasch', covdata=covdata,
##D         formula = list(F1 = ~ group + contvar, F2 = ~ group))
##D coef(mod2)[11:12]
##D mod2b <- mixedmirt(dat, covdata, model, fixed = ~ 0 + items,
##D         lr.fixed = list(F1 = ~ group + contvar, F2 = ~ group))
##D summary(mod2b)
##D 
##D ####################################################
##D ## Simulated Multilevel Rasch Model
##D 
##D set.seed(1)
##D N <- 2000
##D a <- matrix(rep(1,10),10,1)
##D d <- matrix(rnorm(10))
##D cluster = 100
##D random_intercept = rnorm(cluster,0,1)
##D Theta = numeric()
##D for (i in 1:cluster)
##D     Theta <- c(Theta, rnorm(N/cluster,0,1) + random_intercept[i])
##D 
##D group = factor(rep(paste0('G',1:cluster), each = N/cluster))
##D covdata <- data.frame(group)
##D dat <- simdata(a,d,N, itemtype = rep('2PL',10), Theta=matrix(Theta))
##D 
##D # null model
##D mod1 <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items, random = ~ 1|group)
##D summary(mod1)
##D 
##D # include level 2 predictor for 'group' variance
##D covdata$group_pred <- rep(random_intercept, each = N/cluster)
##D mod2 <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items + group_pred, random = ~ 1|group)
##D 
##D # including group means predicts nearly all variability in 'group'
##D summary(mod2)
##D anova(mod1, mod2)
##D 
##D # can also be fit for Rasch/non-Rasch models with the lr.random input
##D mod1b <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items, lr.random = ~ 1|group)
##D summary(mod1b)
##D 
##D mod2b <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items + group_pred, lr.random = ~ 1|group)
##D summary(mod2b)
##D anova(mod1b, mod2b)
##D 
##D mod3 <- mixedmirt(dat, covdata, 1, fixed = ~ 0 + items, lr.random = ~ 1|group, itemtype = '2PL')
##D summary(mod3)
##D anova(mod1b, mod3)
##D 
##D head(cbind(randef(mod3)$group, random_intercept))
##D 
## End(Not run)



