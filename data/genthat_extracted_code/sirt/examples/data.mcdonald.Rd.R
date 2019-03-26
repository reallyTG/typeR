library(sirt)


### Name: data.mcdonald
### Title: Some Datasets from McDonald's _Test Theory_ Book
### Aliases: data.mcdonald.act15 data.mcdonald.LSAT6 data.mcdonald.rape
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: LSAT6 data    | Chapter 12 McDonald (1999)
##D #############################################################################
##D data(data.mcdonald.act15)
##D 
##D #************
##D # Model 1: 2-parameter normal ogive model
##D 
##D #++ NOHARM estimation
##D I <- ncol(dat)
##D # covariance structure
##D P.pattern <- matrix( 0, ncol=1, nrow=1 )
##D P.init <- 1+0*P.pattern
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 1, nrow=I, ncol=1 )
##D F.init <- F.pattern
##D # estimate model
##D mod1a <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D              F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D              writename="LSAT6__1dim_2pno", noharm.path=noharm.path, dec="," )
##D summary(mod1a, logfile="LSAT6__1dim_2pno__SUMMARY")
##D 
##D #++ pairwise marginal maximum likelihood estimation using the probit link
##D mod1b <- sirt::rasch.pml3( dat, est.a=1:I, est.sigma=FALSE)
##D 
##D #************
##D # Model 2: 1-parameter normal ogive model
##D 
##D #++ NOHARM estimation
##D # covariance structure
##D P.pattern <- matrix( 0, ncol=1, nrow=1 )
##D P.init <- 1+0*P.pattern
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 2, nrow=I, ncol=1 )
##D F.init <- 1+0*F.pattern
##D # estimate model
##D mod2a <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D                 F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D                 writename="LSAT6__1dim_1pno", noharm.path=noharm.path, dec="," )
##D summary(mod2a, logfile="LSAT6__1dim_1pno__SUMMARY")
##D 
##D # PMML estimation
##D mod2b <- sirt::rasch.pml3( dat, est.a=rep(1,I), est.sigma=FALSE )
##D summary(mod2b)
##D 
##D #************
##D # Model 3: 3-parameter normal ogive model with fixed guessing parameters
##D 
##D #++ NOHARM estimation
##D # covariance structure
##D P.pattern <- matrix( 0, ncol=1, nrow=1 )
##D P.init <- 1+0*P.pattern
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 1, nrow=I, ncol=1 )
##D F.init <- 1+0*F.pattern
##D # estimate model
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",  guesses=rep(.2,I),
##D             F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D             P.init=P.init, writename="LSAT6__1dim_3pno",
##D             noharm.path=noharm.path, dec="," )
##D summary(mod, logfile="LSAT6__1dim_3pno__SUMMARY")
##D 
##D #++ logistic link function employed in smirt function
##D mod1d <- sirt::smirt(dat, Qmatrix=F.pattern, est.a=matrix(1:I,I,1), c.init=rep(.2,I))
##D summary(mod1d)
##D 
##D #############################################################################
##D # EXAMPLE 2: ACT15 data    | Chapter 6 McDonald (1999)
##D #############################################################################
##D data(data.mcdonald.act15)
##D pm <- data.mcdonald.act15
##D 
##D #************
##D # Model 1: 2-dimensional exploratory factor analysis
##D mod1 <- sirt::R2noharm( pm=pm, n=1000, model.type="EFA", dimensions=2,
##D              writename="ACT15__efa_2dim", noharm.path=noharm.path, dec="," )
##D summary(mod1)
##D 
##D #************
##D # Model 2: 2-dimensional independent clusters basis solution
##D P.pattern <- matrix(1,2,2)
##D diag(P.pattern) <- 0
##D P.init <- 1+0*P.pattern
##D F.pattern <- matrix(0,15,2)
##D F.pattern[ c(1:5,11:15),1] <- 1
##D F.pattern[ c(6:10,11:15),2] <- 1
##D F.init <- F.pattern
##D 
##D # estimate model
##D mod2 <- sirt::R2noharm( pm=pm, n=1000,  model.type="CFA", F.pattern=F.pattern,
##D             F.init=F.init, P.pattern=P.pattern,P.init=P.init,
##D             writename="ACT15_indep_clusters", noharm.path=noharm.path, dec="," )
##D summary(mod2)
##D 
##D #************
##D # Model 3: Hierarchical model
##D 
##D P.pattern <- matrix(0,3,3)
##D P.init <- P.pattern
##D diag(P.init) <- 1
##D F.pattern <- matrix(0,15,3)
##D F.pattern[,1] <- 1    # all items load on g factor
##D F.pattern[ c(1:5,11:15),2] <- 1   # Items 1-5 and 11-15 load on first nested factor
##D F.pattern[ c(6:10,11:15),3] <- 1  # Items 6-10 and 11-15 load on second nested factor
##D F.init <- F.pattern
##D 
##D # estimate model
##D mod3 <- sirt::R2noharm( pm=pm, n=1000,  model.type="CFA", F.pattern=F.pattern,
##D            F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D            writename="ACT15_hierarch_model", noharm.path=noharm.path, dec="," )
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 3: Rape myth scale | Chapter 15 McDonald (1999)
##D #############################################################################
##D data(data.mcdonald.rape)
##D lambda <- data.mcdonald.rape$lambda
##D nu <- data.mcdonald.rape$nu
##D 
##D # obtain multiplier for factor loadings (Formula 15.5)
##D k <- sum( lambda[1,] * lambda[2,] ) / sum( lambda[2,]^2 )
##D   ##   [1] 1.263243
##D 
##D # additive parameter (Formula 15.7)
##D c <- sum( lambda[2,]*(nu[1,]-nu[2,]) ) / sum( lambda[2,]^2 )
##D   ##   [1] 1.247697
##D 
##D # SD in the female group
##D 1/k
##D   ##   [1] 0.7916132
##D 
##D # M in the female group
##D - c/k
##D   ##   [1] -0.9876932
##D 
##D # Burt's coefficient of factorial congruence (Formula 15.10a)
##D sum( lambda[1,] * lambda[2,] ) / sqrt( sum( lambda[1,]^2 ) * sum( lambda[2,]^2 ) )
##D   ##   [1] 0.9727831
##D 
##D # congruence for mean parameters
##D sum(  (nu[1,]-nu[2,]) * lambda[2,] ) / sqrt( sum( (nu[1,]-nu[2,])^2 ) * sum( lambda[2,]^2 ) )
##D   ##   [1] 0.968176
## End(Not run)



