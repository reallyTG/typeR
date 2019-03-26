library(sirt)


### Name: modelfit.sirt
### Title: Assessing Model Fit and Local Dependence by Comparing Observed
###   and Expected Item Pair Correlations
### Aliases: modelfit.sirt modelfit.cor.poly
### Keywords: Model fit

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Reading data
##D #############################################################################
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D #*** Model 1: Rasch model
##D mod1 <- sirt::rasch.mml2(dat)
##D fmod1 <- sirt::modelfit.sirt( mod1 )
##D summary(fmod1)
##D 
##D #*** Model 1b: Rasch model in TAM package
##D library(TAM)
##D mod1b <- TAM::tam.mml(dat)
##D fmod1b <- sirt::modelfit.sirt( mod1b )
##D summary(fmod1b)
##D 
##D #*** Model 2: Rasch model with smoothed distribution
##D mod2 <- sirt::rasch.mml2( dat, distribution.trait="smooth3" )
##D fmod2 <- sirt::modelfit.sirt( mod2 )
##D summary(fmod2 )
##D 
##D #*** Model 3: 2PL model
##D mod3 <- sirt::rasch.mml2( dat, distribution.trait="normal", est.a=1:I )
##D fmod3 <- sirt::modelfit.sirt( mod3 )
##D summary(fmod3 )
##D 
##D #*** Model 3: 2PL model in TAM package
##D mod3b <- TAM::tam.mml.2pl( dat )
##D fmod3b <- sirt::modelfit.sirt(mod3b)
##D summary(fmod3b)
##D # model fit in TAM package
##D tmod3b <- TAM::tam.modelfit(mod3b)
##D summary(tmod3b)
##D # model fit in mirt package
##D library(mirt)
##D mmod3b <- sirt::tam2mirt(mod3b)   # convert to mirt object
##D mirt::M2(mmod3b$mirt)         # global fit statistic
##D mirt::residuals( mmod3b$mirt, type="LD")  # local dependence statistics
##D 
##D #*** Model 4: 3PL model with equal guessing parameter
##D mod4 <- TAM::rasch.mml2( dat, distribution.trait="smooth3", est.a=1:I, est.c=rep(1,I) )
##D fmod4 <- sirt::modelfit.sirt( mod4 )
##D summary(fmod4 )
##D 
##D #*** Model 5: Latent class model with 2 classes
##D mod5 <- sirt::rasch.mirtlc( dat, Nclasses=2 )
##D fmod5 <- sirt::modelfit.sirt( mod5 )
##D summary(fmod5 )
##D 
##D #*** Model 6: Rasch latent class model with 3 classes
##D mod6 <- sirt::rasch.mirtlc( dat, Nclasses=3, modeltype="MLC1", mmliter=100)
##D fmod6 <- sirt::modelfit.sirt( mod6 )
##D summary(fmod6 )
##D 
##D #*** Model 7: PML estimation
##D mod7 <- sirt::rasch.pml3( dat )
##D fmod7 <- sirt::modelfit.sirt( mod7 )
##D summary(fmod7 )
##D 
##D #*** Model 8: PML estimation
##D #      Modelling error correlations:
##D #          joint residual correlations for each item cluster
##D error.corr <- diag(1,ncol(dat))
##D itemcluster <- rep( 1:4,each=3 )
##D for ( ii in 1:3){
##D     ind.ii <- which( itemcluster==ii )
##D     error.corr[ ind.ii, ind.ii ] <- ii
##D         }
##D mod8 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D fmod8 <- sirt::modelfit.sirt( mod8 )
##D summary(fmod8 )
##D 
##D #*** Model 9: 1PL in smirt
##D Qmatrix <- matrix( 1, nrow=I, ncol=1 )
##D mod9 <- sirt::smirt( dat, Qmatrix=Qmatrix )
##D fmod9 <- sirt::modelfit.sirt( mod9 )
##D summary(fmod9 )
##D 
##D #*** Model 10: 3-dimensional Rasch model in NOHARM
##D noharm.path <- "c:/NOHARM"
##D Q <- matrix( 0, nrow=12, ncol=3 )
##D Q[ cbind(1:12, rep(1:3,each=4) ) ] <- 1
##D rownames(Q) <- colnames(dat)
##D colnames(Q) <- c("A","B","C")
##D # covariance matrix
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D P.init <- 0.8+0*P.pattern
##D diag(P.init) <- 1
##D # loading matrix
##D F.pattern <- 0*Q
##D F.init <- Q
##D # estimate model
##D mod10 <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D             F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D             writename="ex4e", noharm.path=noharm.path, dec="," )
##D fmod10 <- sirt::modelfit.sirt( mod10 )
##D summary(fmod10)
##D 
##D #*** Model 11: Rasch model in mirt package
##D library(mirt)
##D mod11 <- mirt::mirt(dat, 1, itemtype="Rasch",verbose=TRUE)
##D fmod11 <- sirt::modelfit.sirt( mod11 )
##D summary(fmod11)
##D # model fit in mirt package
##D mirt::M2(mod11)
##D mirt::residuals(mod11)
## End(Not run)



