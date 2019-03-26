library(sirt)


### Name: data.bs
### Title: Datasets from Borg and Staufenbiel (2007)
### Aliases: data.bs data.bs07a
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 07a: Dataset Gefechtsangst
##D #############################################################################
##D 
##D data(data.bs07a)
##D dat <- data.bs07a
##D items <- grep( "GF", colnames(dat), value=TRUE )
##D 
##D #************************
##D # Model 1: Rasch model
##D mod1 <- TAM::tam.mml(dat[,items] )
##D summary(mod1)
##D IRT.WrightMap(mod1)
##D 
##D #************************
##D # Model 2: 2PL model
##D mod2 <- TAM::tam.mml.2pl(dat[,items] )
##D summary(mod2)
##D 
##D #************************
##D # Model 3: Latent class analysis (LCA) with two classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(2)
##D   NSTARTS(5,10)
##D LAVAAN MODEL:
##D   F=~ GF1__GF9
##D   "
##D mod3 <- TAM::tamaan( tammodel, dat )
##D summary(mod3)
##D 
##D #************************
##D # Model 4: LCA with three classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(3)
##D   NSTARTS(5,10)
##D LAVAAN MODEL:
##D   F=~ GF1__GF9
##D   "
##D mod4 <- TAM::tamaan( tammodel, dat )
##D summary(mod4)
##D 
##D #************************
##D # Model 5: Located latent class model (LOCLCA) with two classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LOCLCA;
##D   NCLASSES(2)
##D   NSTARTS(5,10)
##D LAVAAN MODEL:
##D   F=~ GF1__GF9
##D   "
##D mod5 <- TAM::tamaan( tammodel, dat )
##D summary(mod5)
##D 
##D #************************
##D # Model 6: Located latent class model with three classes
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LOCLCA;
##D   NCLASSES(3)
##D   NSTARTS(5,10)
##D LAVAAN MODEL:
##D   F=~ GF1__GF9
##D   "
##D mod6 <- TAM::tamaan( tammodel, dat )
##D summary(mod6)
##D 
##D #************************
##D # Model 7: Probabilistic Guttman model
##D mod7 <- sirt::prob.guttman( dat[,items] )
##D summary(mod7)
##D 
##D #-- model comparison
##D IRT.compareModels( mod1, mod2, mod3, mod4, mod5, mod6, mod7 )
## End(Not run)



