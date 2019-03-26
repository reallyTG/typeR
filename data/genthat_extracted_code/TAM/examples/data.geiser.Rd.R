library(TAM)


### Name: data.geiser
### Title: Dataset from Geiser et al. (2006)
### Aliases: data.geiser
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Latent trait and latent class models (Geiser et al., 2006, MBR)
##D #############################################################################
##D 
##D data(data.geiser)
##D dat <- data.geiser
##D 
##D #**********************************************
##D # Model 1: Rasch model
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F=~ 1*mrt1__mrt12
##D     F ~~ F
##D   ITEM TYPE:
##D     ALL(Rasch)
##D     "
##D mod1 <- TAM::tamaan( tammodel, dat)
##D summary(mod1)
##D 
##D #**********************************************
##D # Model 2: 2PL model
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F=~ mrt1__mrt12
##D     F ~~ 1*F
##D     "
##D mod2 <- TAM::tamaan( tammodel, dat)
##D summary(mod2)
##D 
##D # model comparison Rasch vs. 2PL
##D anova(mod1,mod2)
##D 
##D #*********************************************************************
##D #*** Model 3: Latent class analysis with four classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(4);   # 4 classes
##D   NSTARTS(10,20); # 10 random starts with 20 iterations
##D LAVAAN MODEL:
##D   F=~ mrt1__mrt12
##D     "
##D mod3 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod3)
##D 
##D # extract item response functions
##D imod2 <- IRT.irfprob(mod3)[,2,]
##D # plot class specific probabilities
##D matplot( imod2, type="o", pch=1:4, xlab="Item", ylab="Probability" )
##D legend( 10,1, paste0("Class",1:4), lty=1:4, col=1:4, pch=1:4 )
##D 
##D #*********************************************************************
##D #*** Model 4: Latent class analysis with five classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(5);
##D   NSTARTS(10,20);
##D LAVAAN MODEL:
##D   F=~ mrt1__mrt12
##D     "
##D mod4 <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod4)
##D 
##D # compare different models
##D AIC(mod1); AIC(mod2); AIC(mod3); AIC(mod4)
##D BIC(mod1); BIC(mod2); BIC(mod3); BIC(mod4)
##D # more condensed form
##D IRT.compareModels(mod1, mod2, mod3, mod4)
##D 
##D #############################################################################
##D # EXAMPLE 2: Rasch model and mixture Rasch model (Geiser & Eid, 2010)
##D #############################################################################
##D 
##D data(data.geiser)
##D dat <- data.geiser
##D 
##D #*********************************************************************
##D #*** Model 1: Rasch model
##D tammodel <- "
##D LAVAAN MODEL:
##D   F=~ mrt1__mrt6
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod1 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod1)
##D 
##D #*********************************************************************
##D #*** Model 2: Mixed Rasch model with two classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE ;
##D   NCLASSES(2);
##D   NSTARTS(20,25);
##D LAVAAN MODEL:
##D   F=~ mrt1__mrt6
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod2 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod2)
##D 
##D # plot item parameters
##D ipars <- mod2$itempartable_MIXTURE[ 1:6, ]
##D plot( 1:6, ipars[,3], type="o", ylim=c(-3,2), pch=16,
##D         xlab="Item", ylab="Item difficulty")
##D lines( 1:6, ipars[,4], type="l", col=2, lty=2)
##D points( 1:6, ipars[,4],  col=2, pch=2)
##D 
##D # extract individual posterior distribution
##D post2 <- IRT.posterior(mod2)
##D str(post2)
##D # num [1:519, 1:30] 0.000105 0.000105 0.000105 0.000105 0.000105 ...
##D # - attr(*, "theta")=num [1:30, 1:30] 1 0 0 0 0 0 0 0 0 0 ...
##D # - attr(*, "prob.theta")=num [1:30, 1] 1.21e-05 2.20e-04 2.29e-03 1.37e-02 4.68e-02 ...
##D # - attr(*, "G")=num 1
##D 
##D # There are 2 classes and 15 theta grid points for each class
##D # The loadings of the theta grid on items are as follows
##D mod2$E[1,2,,"mrt1_F_load_Cl1"]
##D mod2$E[1,2,,"mrt1_F_load_Cl2"]
##D 
##D # compute individual posterior probability for class 1 (first 15 columns)
##D round( rowSums( post2[, 1:15] ), 3 )
##D # columns 16 to 30 refer to class 2
##D 
##D #*********************************************************************
##D #*** Model 3: Mixed Rasch model with three classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE ;
##D   NCLASSES(3);
##D   NSTARTS(20,25);
##D LAVAAN MODEL:
##D   F=~ mrt1__mrt6
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod3 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod3)
##D 
##D # plot item parameters
##D ipars <- mod3$itempartable_MIXTURE[ 1:6, ]
##D plot( 1:6, ipars[,3], type="o", ylim=c(-3.7,2), pch=16,
##D         xlab="Item", ylab="Item difficulty")
##D lines( 1:6, ipars[,4], type="l", col=2, lty=2)
##D points( 1:6, ipars[,4],  col=2, pch=2)
##D lines( 1:6, ipars[,5], type="l", col=3, lty=3)
##D points( 1:6, ipars[,5],  col=3, pch=17)
##D 
##D # model comparison
##D IRT.compareModels( mod1, mod2, mod3 )
## End(Not run)



