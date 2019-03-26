library(CDM)


### Name: gdina
### Title: Estimating the Generalized DINA (GDINA) Model
### Aliases: gdina summary.gdina plot.gdina print.gdina
### Keywords: Cognitive Diagnosis Models GDINA DINA Higher order GDINA
###   model summary plot print

### ** Examples

#############################################################################
# EXAMPLE 1: Simulated DINA data | different condensation rules
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

dat <- sim.dina
Q <- sim.qmatrix

#***
# Model 1: estimation of the GDINA model (identity link)
mod1 <- CDM::gdina( data=dat,  q.matrix=Q)
summary(mod1)
plot(mod1) # apply plot function

## Not run: 
##D # Model 1a: estimate model with different simulation seed
##D mod1a <- CDM::gdina( data=dat,  q.matrix=Q, seed=9089)
##D summary(mod1a)
##D 
##D # Model 1b: estimate model with some fixed delta parameters
##D delta.fixed <- as.list( rep(NA,9) )        # List for parameters of 9 items
##D delta.fixed[[2]] <- c( 0, .15, .15, .45 )
##D delta.fixed[[6]] <- c( .25, .25 )
##D mod1b <- CDM::gdina( data=dat,  q.matrix=Q, delta.fixed=delta.fixed)
##D summary(mod1b)
##D 
##D # Model 1c: fix all delta parameters to previously fitted model
##D mod1c <- CDM::gdina( data=dat,  q.matrix=Q, delta.fixed=mod1$delta)
##D summary(mod1c)
##D 
##D # Model 1d: estimate GDINA model with GDINA package
##D mod1d <- GDINA::GDINA( dat=dat, Q=Q, model="GDINA" )
##D summary(mod1d)
##D # extract item parameters
##D GDINA::itemparm(mod1d)
##D GDINA::itemparm(mod1d, what="delta")
##D # compare likelihood
##D logLik(mod1)
##D logLik(mod1d)
##D 
##D #***
##D # Model 2: estimation of the DINA model with gdina function
##D mod2 <- CDM::gdina( data=dat,  q.matrix=Q, rule="DINA")
##D summary(mod2)
##D plot(mod2)
##D 
##D #***
##D # Model 2b: compare results with din function
##D mod2b <- CDM::din( data=dat,  q.matrix=Q, rule="DINA")
##D summary(mod2b)
##D 
##D # Model 2: estimation of the DINO model with gdina function
##D mod3 <- CDM::gdina( data=dat,  q.matrix=Q, rule="DINO")
##D summary(mod3)
##D 
##D #***
##D # Model 4: DINA model with logit link
##D mod4 <- CDM::gdina( data=dat, q.matrix=Q, rule="DINA", linkfct="logit" )
##D summary(mod4)
##D 
##D #***
##D # Model 5: DINA model log link
##D mod5 <- CDM::gdina( data=dat, q.matrix=Q, rule="DINA", linkfct="log")
##D summary(mod5)
##D 
##D #***
##D # Model 6: RRUM model
##D mod6 <- CDM::gdina( data=dat, q.matrix=Q, rule="RRUM")
##D summary(mod6)
##D 
##D #***
##D # Model 7: Higher order GDINA model
##D mod7 <- CDM::gdina( data=dat, q.matrix=Q, HOGDINA=1)
##D summary(mod7)
##D 
##D #***
##D # Model 8: GDINA model with independent attributes
##D mod8 <- CDM::gdina( data=dat, q.matrix=Q, HOGDINA=0)
##D summary(mod8)
##D 
##D #***
##D # Model 9: Estimating the GDINA model with monotonicity constraints
##D mod9 <- CDM::gdina( data=dat, q.matrix=Q, rule="GDINA",
##D               mono.constr=TRUE, linkfct="logit")
##D summary(mod9)
##D 
##D #***
##D # Model 10: Estimating the ACDM model with SCAD penalty and regularization
##D #           parameter of .05
##D mod10 <- CDM::gdina( data=dat, q.matrix=Q, rule="ACDM",
##D                 linkfct="logit", regular_type="scad", regular_lam=.05 )
##D summary(mod10)
##D 
##D #***
##D # Model 11: Estimation of GDINA model with prior distributions
##D 
##D # N(0,10^2) prior for item intercepts
##D prior_intercepts <- c(0,10)
##D # N(0,1^2) prior for item slopes
##D prior_slopes <- c(0,1)
##D # estimate model
##D mod11 <- CDM::gdina( data=dat, q.matrix=Q, rule="GDINA",
##D               prior_intercepts=prior_intercepts, prior_slopes=prior_slopes)
##D summary(mod11)
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated DINO data
##D #    additive cognitive diagnosis model with different link functions
##D #############################################################################
##D 
##D data(sim.dino, package="CDM")
##D data(sim.matrix, package="CDM")
##D 
##D dat <- sim.dino
##D Q <- sim.qmatrix
##D 
##D #***
##D # Model 1: additive cognitive diagnosis model (ACDM; identity link)
##D mod1 <- CDM::gdina( data=dat, q.matrix=Q,  rule="ACDM")
##D summary(mod1)
##D 
##D #***
##D # Model 2: ACDM logit link
##D mod2 <- CDM::gdina( data=dat, q.matrix=Q, rule="ACDM", linkfct="logit")
##D summary(mod2)
##D 
##D #***
##D # Model 3: ACDM log link
##D mod3 <- CDM::gdina( data=dat, q.matrix=Q, rule="ACDM", linkfct="log")
##D summary(mod3)
##D 
##D #***
##D # Model 4: Different condensation rules per item
##D I <- 9      # number of items
##D rule <- rep( "GDINA", I )
##D rule[1] <- "DINO"   # 1st item: DINO model
##D rule[7] <- "GDINA2" # 7th item: GDINA model with first- and second-order interactions
##D rule[8] <- "ACDM"   # 8ht item: additive CDM
##D rule[9] <- "DINA"   # 9th item: DINA model
##D mod4 <- CDM::gdina( data=dat, q.matrix=Q, rule=rule )
##D summary(mod4)
##D 
##D #############################################################################
##D # EXAMPLE 3: Model with user-specified design matrices
##D #############################################################################
##D 
##D data(sim.dino, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D dat <- sim.dino
##D Q <- sim.qmatrix
##D 
##D # do a preliminary analysis and modify obtained design matrices
##D mod0 <- CDM::gdina( data=dat,  q.matrix=Q,  maxit=1)
##D 
##D # extract default design matrices
##D Mj <- mod0$Mj
##D Mj.user <- Mj   # these user defined design matrices are modified.
##D #~~~  For the second item, the following model should hold
##D #     X1 ~ V2 + V2*V3
##D mj <- Mj[[2]][[1]]
##D mj.lab <- Mj[[2]][[2]]
##D mj <- mj[,-3]
##D mj.lab <- mj.lab[-3]
##D Mj.user[[2]] <- list( mj, mj.lab )
##D #    [[1]]
##D #        [,1] [,2] [,3]
##D #    [1,]    1    0    0
##D #    [2,]    1    1    0
##D #    [3,]    1    0    0
##D #    [4,]    1    1    1
##D #    [[2]]
##D #    [1] "0"   "1"   "1-2"
##D #~~~  For the eight item an equality constraint should hold
##D #     X8 ~ a*V2 + a*V3 + V2*V3
##D mj <- Mj[[8]][[1]]
##D mj.lab <- Mj[[8]][[2]]
##D mj[,2] <- mj[,2] + mj[,3]
##D mj <- mj[,-3]
##D mj.lab <- c("0", "1=2", "1-2" )
##D Mj.user[[8]] <- list( mj, mj.lab )
##D Mj.user[[8]]
##D   ##   [[1]]
##D   ##        [,1] [,2] [,3]
##D   ##   [1,]    1    0    0
##D   ##   [2,]    1    1    0
##D   ##   [3,]    1    1    0
##D   ##   [4,]    1    2    1
##D   ##
##D   ##   [[2]]
##D   ##   [1] "0"   "1=2" "1-2"
##D mod <- CDM::gdina( data=dat,  q.matrix=Q,
##D                     Mj=Mj.user,  maxit=200 )
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 4: Design matrix for delta parameters
##D #############################################################################
##D 
##D data(sim.dino, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #~~~ estimate an initial model
##D mod0 <- CDM::gdina( data=dat,  q.matrix=Q, rule="ACDM", maxit=1)
##D # extract coefficients
##D c0 <- mod0$coef
##D I <- 9  # number of items
##D delta.designmatrix <- matrix( 0, nrow=nrow(c0), ncol=nrow(c0) )
##D diag( delta.designmatrix) <- 1
##D # set intercept of item 1 and item 3 equal to each other
##D delta.designmatrix[ 7, 1 ] <- 1 ; delta.designmatrix[,7] <- 0
##D # set loading of V1 of item1 and item 3 equal
##D delta.designmatrix[ 8, 2 ] <- 1 ; delta.designmatrix[,8] <- 0
##D delta.designmatrix <- delta.designmatrix[, -c(7:8) ]
##D                 # exclude original parameters with indices 7 and 8
##D 
##D #***
##D # Model 1: ACDM with designmatrix
##D mod1 <- CDM::gdina( data=dat,  q.matrix=Q,  rule="ACDM",
##D             delta.designmatrix=delta.designmatrix )
##D summary(mod1)
##D 
##D #***
##D # Model 2: Same model, but with logit link instead of identity link function
##D mod2 <- CDM::gdina( data=dat,  q.matrix=Q,  rule="ACDM",
##D             delta.designmatrix=delta.designmatrix, linkfct="logit")
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 5: Multiple group estimation
##D #############################################################################
##D 
##D # simulate data
##D set.seed(9279)
##D N1 <- 200 ; N2 <- 100   # group sizes
##D I <- 10                 # number of items
##D q.matrix <- matrix(0,I,2)   # create Q-matrix
##D q.matrix[1:7,1] <- 1 ; q.matrix[ 5:10,2] <- 1
##D # simulate first group
##D dat1 <- CDM::sim.din(N1, q.matrix=q.matrix, mean=c(0,0) )$dat
##D # simulate second group
##D dat2 <- CDM::sim.din(N2, q.matrix=q.matrix, mean=c(-.3, -.7) )$dat
##D # merge data
##D dat <- rbind( dat1, dat2 )
##D # group indicator
##D group <- c( rep(1,N1), rep(2,N2) )
##D 
##D # estimate GDINA model with multiple groups assuming invariant item parameters
##D mod1 <- CDM::gdina( data=dat, q.matrix=q.matrix,  group=group)
##D summary(mod1)
##D 
##D # estimate DINA model with multiple groups assuming invariant item parameters
##D mod2 <- CDM::gdina( data=dat, q.matrix=q.matrix, group=group, rule="DINA")
##D summary(mod2)
##D 
##D # estimate GDINA model with noninvariant item parameters
##D mod3 <- CDM::gdina( data=dat, q.matrix=q.matrix,  group=group, invariance=FALSE)
##D summary(mod3)
##D 
##D # estimate GDINA model with some invariant item parameters (I001, I006, I008)
##D mod4 <- CDM::gdina( data=dat, q.matrix=q.matrix,  group=group,
##D             invariance=c("I001", "I006","I008") )
##D 
##D #--- model comparison
##D IRT.compareModels(mod1,mod2,mod3,mod4)
##D 
##D # estimate GDINA model with non-invariant item parameters except for the
##D # items I001, I006, I008
##D mod5 <- CDM::gdina( data=dat, q.matrix=q.matrix,  group=group,
##D             invariance=setdiff( colnames(dat), c("I001", "I006","I008") ) )
##D 
##D #############################################################################
##D # EXAMPLE 6: User specified reduced skill space
##D #############################################################################
##D 
##D #   Some correlations between attributes should be set to zero.
##D q.matrix <- expand.grid( c(0,1), c(0,1), c(0,1), c(0,1) )
##D colnames(q.matrix) <- colnames( paste("Attr", 1:4,sep=""))
##D q.matrix <- q.matrix[ -1, ]
##D Sigma <- matrix( .5, nrow=4, ncol=4 )
##D diag(Sigma) <- 1
##D Sigma[3,2] <- Sigma[2,3] <- 0 # set correlation of attribute A2 and A3 to zero
##D dat <- CDM::sim.din( N=1000, q.matrix=q.matrix, Sigma=Sigma)$dat
##D 
##D #~~~ Step 1: initial estimation
##D mod1a <- CDM::gdina( data=dat, q.matrix=q.matrix, maxit=1, rule="DINA")
##D # estimate also "full" model
##D mod1 <- CDM::gdina( data=dat, q.matrix=q.matrix, rule="DINA")
##D 
##D #~~~ Step 2: modify designmatrix for reduced skillspace
##D Z.skillspace <- data.frame( mod1a$Z.skillspace )
##D # set correlations of A2/A4 and A3/A4 to zero
##D vars <- c("A2_A3","A2_A4")
##D for (vv in vars){ Z.skillspace[,vv] <- NULL }
##D 
##D #~~~ Step 3: estimate model with reduced skillspace
##D mod2 <- CDM::gdina( data=dat, q.matrix=q.matrix,
##D               Z.skillspace=Z.skillspace, rule="DINA")
##D 
##D #~~~ eliminate all covariances
##D Z.skillspace <- data.frame( mod1$Z.skillspace )
##D colnames(Z.skillspace)
##D Z.skillspace <- Z.skillspace[, -grep( "_", colnames(Z.skillspace),fixed=TRUE)]
##D colnames(Z.skillspace)
##D 
##D mod3 <- CDM::gdina( data=dat, q.matrix=q.matrix,
##D                Z.skillspace=Z.skillspace, rule="DINA")
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 7: Polytomous GDINA model (Chen & de la Torre, 2013)
##D #############################################################################
##D 
##D data(data.pgdina, package="CDM")
##D 
##D dat <- data.pgdina$dat
##D q.matrix <- data.pgdina$q.matrix
##D 
##D # pGDINA model with "DINA rule"
##D mod1 <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA")
##D summary(mod1)
##D # no reduced skill space
##D mod1a <- CDM::gdina( dat, q.matrix=q.matrix, rule="DINA",reduced.skillspace=FALSE)
##D summary(mod1)
##D 
##D # pGDINA model with "GDINA rule"
##D mod2 <- CDM::gdina( dat, q.matrix=q.matrix, rule="GDINA")
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 8: Fraction subtraction data: DINA and HO-DINA model
##D #############################################################################
##D 
##D data(fraction.subtraction.data, package="CDM")
##D data(fraction.subtraction.qmatrix, package="CDM")
##D 
##D dat <- fraction.subtraction.data
##D Q <- fraction.subtraction.qmatrix
##D 
##D # Model 1: DINA model
##D mod1 <- CDM::gdina( dat, q.matrix=Q, rule="DINA")
##D summary(mod1)
##D 
##D # Model 2: HO-DINA model
##D mod2 <- CDM::gdina( dat, q.matrix=Q, HOGDINA=1, rule="DINA")
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 9: Skill space approximation data.jang
##D #############################################################################
##D 
##D data(data.jang, package="CDM")
##D 
##D data <- data.jang$data
##D q.matrix <- data.jang$q.matrix
##D 
##D #*** Model 1: Reduced RUM model
##D mod1 <- CDM::gdina( data, q.matrix, rule="RRUM", conv.crit=.001, maxit=500 )
##D 
##D #*** Model 2: Reduced RUM model with skill space approximation
##D # use 300 instead of 2^9=512 skill classes
##D skillspace <- CDM::skillspace.approximation( L=300, K=ncol(q.matrix) )
##D mod2 <- CDM::gdina( data, q.matrix, rule="RRUM", conv.crit=.001,
##D             skillclasses=skillspace )
##D   ##   > logLik(mod1)
##D   ##   'log Lik.' -30318.08 (df=153)
##D   ##   > logLik(mod2)
##D   ##   'log Lik.' -30326.52 (df=153)
##D 
##D #############################################################################
##D # EXAMPLE 10: CDM with a linear hierarchy
##D #############################################################################
##D # This model is equivalent to a unidimensional IRT model with an ordered
##D # ordinal latent trait and is actually a probabilistic Guttman model.
##D set.seed(789)
##D 
##D # define 3 competency levels
##D alpha <- scan()
##D    0 0 0   1 0 0   1 1 0   1 1 1
##D 
##D # define skill class distribution
##D K <- 3
##D skillspace <- alpha <- matrix( alpha, K + 1,  K, byrow=TRUE )
##D alpha <- alpha[ rep(  1:4,  c(300,300,200,200) ), ]
##D # P(000)=P(100)=.3, P(110)=P(111)=.2
##D # define Q-matrix
##D Q <- scan()
##D     1 0 0   1 1 0   1 1 1
##D 
##D Q <- matrix( Q, nrow=K,  ncol=K, byrow=TRUE )
##D Q <- Q[ rep(1:K, each=4 ), ]
##D colnames(skillspace) <- colnames(Q) <- paste0("A",1:K)
##D I <- nrow(Q)
##D 
##D # define guessing and slipping parameters
##D guess <- stats::runif( I, 0, .3 )
##D slip <- stats::runif( I, 0, .2 )
##D # simulate data
##D dat <- CDM::sim.din( q.matrix=Q, alpha=alpha, slip=slip, guess=guess )$dat
##D 
##D #*** Model 1: DINA model with linear hierarchy
##D mod1 <- CDM::din( dat, q.matrix=Q, rule="DINA",  skillclasses=skillspace )
##D summary(mod1)
##D 
##D #*** Model 2: pGDINA model with 3 levels
##D #    The multidimensional CDM with a linear hierarchy is a unidimensional
##D #    polytomous GDINA model.
##D Q2 <- matrix( rowSums(Q), nrow=I, ncol=1 )
##D mod2 <- CDM::gdina( dat, q.matrix=Q2, rule="DINA" )
##D summary(mod2)
##D 
##D #*** Model 3: estimate probabilistic Guttman model in sirt
##D #    Proctor, C. H. (1970). A probabilistic formulation and statistical
##D #    analysis for Guttman scaling. Psychometrika, 35, 73-78.
##D library(sirt)
##D mod3 <- sirt::prob.guttman( dat, itemlevel=Q2[,1] )
##D summary(mod3)
##D # -> The three models result in nearly equivalent fit.
##D 
##D #############################################################################
##D # EXAMPLE 11: Sequential GDINA model (Ma & de la Torre, 2016)
##D #############################################################################
##D 
##D data(data.cdm04, package="CDM")
##D 
##D #** attach dataset
##D dat <- data.cdm04$data    # polytomous item responses
##D q.matrix1 <- data.cdm04$q.matrix1
##D q.matrix2 <- data.cdm04$q.matrix2
##D 
##D #-- DINA model with first Q-matrix
##D mod1 <- CDM::gdina( dat, q.matrix=q.matrix1, rule="DINA")
##D summary(mod1)
##D #-- DINA model with second Q-matrix
##D mod2 <- CDM::gdina( dat, q.matrix=q.matrix2, rule="DINA")
##D #-- GDINA model
##D mod3 <- CDM::gdina( dat, q.matrix=q.matrix2, rule="GDINA")
##D 
##D #** model comparison
##D IRT.compareModels(mod1,mod2,mod3)
##D 
##D #############################################################################
##D # EXAMPLE 12: SISM model involving skills and misconceptions (Kuo et al., 2018)
##D #############################################################################
##D 
##D data(data.cdm08, package="CDM")
##D dat <- data.cdm08$data
##D q.matrix <- data.cdm08$q.matrix
##D 
##D #*** estimate model
##D mod <- CDM::gdina( dat0, q.matrix, rule="SISM", bugs=colnames(q.matrix)[5:7] )
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 13: Regularized estimation in GDINA model
##D #############################################################################
##D 
##D data(data.ecpe, package="CDM")
##D dat <- data.ecpe$data[,-1]
##D Q <- data.ecpe$q.matrix
##D 
##D #* LASSO regularization with lambda parameter of .12
##D mod <- CDM::gdina(dat, q.matrix=Q, rule="GDINA", regular_lam=.12, regular_type="lasso")
##D summary(mod)
## End(Not run)



