library(mirt)


### Name: bfactor
### Title: Full-Information Item Bi-factor and Two-Tier Analysis
### Aliases: bfactor
### Keywords: models

### ** Examples


## Not run: 
##D 
##D ###load SAT12 and compute bifactor model with 3 specific factors
##D data(SAT12)
##D data <- key2binary(SAT12,
##D   key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D specific <- c(2,3,2,3,3,2,1,2,1,1,1,3,1,3,1,2,1,1,3,3,1,1,3,1,3,3,1,3,2,3,1,2)
##D mod1 <- bfactor(data, specific)
##D summary(mod1)
##D itemplot(mod1, 18, drop.zeros = TRUE) #drop the zero slopes to allow plotting
##D 
##D ###Try with fixed guessing parameters added
##D guess <- rep(.1,32)
##D mod2 <- bfactor(data, specific, guess = guess)
##D coef(mod2)
##D anova(mod1, mod2)
##D 
##D ## don't estimate specific factor for item 32
##D specific[32] <- NA
##D mod3 <- bfactor(data, specific)
##D anova(mod1, mod3)
##D 
##D # same, but declared manually (not run)
##D #sv <- mod2values(mod1)
##D #sv$value[220] <- 0 #parameter 220 is the 32 items specific slope
##D #sv$est[220] <- FALSE
##D #mod3 <- bfactor(data, specific, pars = sv) #with excellent starting values
##D 
##D 
##D #########
##D # mixed itemtype example
##D 
##D #simulate data
##D a <- matrix(c(
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,0.5,NA,
##D 1,NA,0.5,
##D 1,NA,0.5,
##D 1,NA,0.5,
##D 1,NA,0.5,
##D 1,NA,0.5,
##D 1,NA,0.5,
##D 1,NA,0.5),ncol=3,byrow=TRUE)
##D 
##D d <- matrix(c(
##D -1.0,NA,NA,
##D -1.5,NA,NA,
##D  1.5,NA,NA,
##D  0.0,NA,NA,
##D 2.5,1.0,-1,
##D 3.0,2.0,-0.5,
##D 3.0,2.0,-0.5,
##D 3.0,2.0,-0.5,
##D 2.5,1.0,-1,
##D 2.0,0.0,NA,
##D -1.0,NA,NA,
##D -1.5,NA,NA,
##D  1.5,NA,NA,
##D  0.0,NA,NA),ncol=3,byrow=TRUE)
##D items <- rep('2PL', 14)
##D items[5:10] <- 'graded'
##D 
##D sigma <- diag(3)
##D dataset <- simdata(a,d,2000,itemtype=items,sigma=sigma)
##D 
##D specific <- c(rep(1,7),rep(2,7))
##D simmod <- bfactor(dataset, specific)
##D coef(simmod)
##D 
##D #########
##D # testlet response model
##D 
##D #simulate data
##D set.seed(1234)
##D a <- matrix(0, 12, 4)
##D a[,1] <- rlnorm(12, .2, .3)
##D ind <- 1
##D for(i in 1:3){
##D    a[ind:(ind+3),i+1] <- a[ind:(ind+3),1]
##D    ind <- ind+4
##D }
##D print(a)
##D d <- rnorm(12, 0, .5)
##D sigma <- diag(c(1, .5, 1, .5))
##D dataset <- simdata(a,d,2000,itemtype=rep('2PL', 12),sigma=sigma)
##D 
##D # estimate by applying constraints and freeing the latent variances
##D specific <- c(rep(1,4),rep(2,4), rep(3,4))
##D model <- "G = 1-12
##D           CONSTRAIN = (1, a1, a2), (2, a1, a2), (3, a1, a2), (4, a1, a2),
##D             (5, a1, a3), (6, a1, a3), (7, a1, a3), (8, a1, a3),
##D             (9, a1, a4), (10, a1, a4), (11, a1, a4), (12, a1, a4)
##D           COV = S1*S1, S2*S2, S3*S3"
##D 
##D simmod <- bfactor(dataset, specific, model)
##D coef(simmod, simplify=TRUE)
##D 
##D 
##D #########
##D # Two-tier model
##D 
##D #simulate data
##D set.seed(1234)
##D a <- matrix(c(
##D   0,1,0.5,NA,NA,
##D   0,1,0.5,NA,NA,
##D   0,1,0.5,NA,NA,
##D   0,1,0.5,NA,NA,
##D   0,1,0.5,NA,NA,
##D   0,1,NA,0.5,NA,
##D   0,1,NA,0.5,NA,
##D   0,1,NA,0.5,NA,
##D   1,0,NA,0.5,NA,
##D   1,0,NA,0.5,NA,
##D   1,0,NA,0.5,NA,
##D   1,0,NA,NA,0.5,
##D   1,0,NA,NA,0.5,
##D   1,0,NA,NA,0.5,
##D   1,0,NA,NA,0.5,
##D   1,0,NA,NA,0.5),ncol=5,byrow=TRUE)
##D 
##D d <- matrix(rnorm(16))
##D items <- rep('2PL', 16)
##D 
##D sigma <- diag(5)
##D sigma[1,2] <- sigma[2,1] <- .4
##D dataset <- simdata(a,d,2000,itemtype=items,sigma=sigma)
##D 
##D specific <- c(rep(1,5),rep(2,6),rep(3,5))
##D model <- '
##D     G1 = 1-8
##D     G2 = 9-16
##D     COV = G1*G2'
##D 
##D #quadpts dropped for faster estimation, but not as precise
##D simmod <- bfactor(dataset, specific, model, quadpts = 9, TOL = 1e-3)
##D coef(simmod, simplify=TRUE)
##D summary(simmod)
##D itemfit(simmod, QMC=TRUE)
##D M2(simmod, QMC=TRUE)
##D residuals(simmod, QMC=TRUE)
##D 
##D     
## End(Not run)




