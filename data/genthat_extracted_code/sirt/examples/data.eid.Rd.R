library(sirt)


### Name: data.eid
### Title: Examples with Datasets from Eid and Schmidt (2014)
### Aliases: data.eid data.eid.kap4 data.eid.kap5 data.eid.kap6
###   data.eid.kap7
### Keywords: datasets

### ** Examples

## Not run: 
##D miceadds::library_install("foreign")
##D #---- load some IRT packages in R
##D miceadds::library_install("TAM")        # package (a)
##D miceadds::library_install("mirt")       # package (b)
##D miceadds::library_install("sirt")       # package (c)
##D miceadds::library_install("eRm")        # package (d)
##D miceadds::library_install("ltm")        # package (e)
##D miceadds::library_install("psychomix")  # package (f)
##D 
##D #############################################################################
##D # EXAMPLES Ch. 4: Unidimensional IRT models | dichotomous data
##D #############################################################################
##D 
##D data(data.eid.kap4)
##D data0 <- data.eid.kap4
##D 
##D # load data
##D data0 <- foreign::read.spss( linkname, to.data.frame=TRUE, use.value.labels=FALSE)
##D # extract items
##D dat <- data0[,2:11]
##D 
##D #*********************************************************
##D # Model 1: Rasch model
##D #*********************************************************
##D 
##D #-----------
##D #-- 1a: estimation with TAM package
##D 
##D # estimation with tam.mml
##D mod1a <- TAM::tam.mml(dat)
##D summary(mod1a)
##D 
##D # person parameters in TAM
##D pp1a <- TAM::tam.wle(mod1a)
##D 
##D # plot item response functions
##D plot(mod1a,export=FALSE,ask=TRUE)
##D 
##D # Infit and outfit in TAM
##D itemf1a <- TAM::tam.fit(mod1a)
##D itemf1a
##D 
##D # model fit
##D modf1a <- TAM::tam.modelfit(mod1a)
##D summary(modf1a)
##D 
##D #-----------
##D #-- 1b: estimation with mirt package
##D 
##D # estimation with mirt
##D mod1b <- mirt::mirt( dat, 1, itemtype="Rasch")
##D summary(mod1b)
##D print(mod1b)
##D 
##D # person parameters
##D pp1b <- mirt::fscores(mod1b, method="WLE")
##D 
##D # extract coefficients
##D sirt::mirt.wrapper.coef(mod1b)
##D 
##D # plot item response functions
##D plot(mod1b, type="trace" )
##D par(mfrow=c(1,1))
##D 
##D # item fit
##D itemf1b <- mirt::itemfit(mod1b)
##D itemf1b
##D 
##D # model fit
##D modf1b <- mirt::M2(mod1b)
##D modf1b
##D 
##D #-----------
##D #-- 1c: estimation with sirt package
##D 
##D # estimation with rasch.mml2
##D mod1c <- sirt::rasch.mml2(dat)
##D summary(mod1c)
##D 
##D # person parameters (EAP)
##D pp1c <- mod1c$person
##D 
##D # plot item response functions
##D plot(mod1c, ask=TRUE )
##D 
##D # model fit
##D modf1c <- sirt::modelfit.sirt(mod1c)
##D summary(modf1c)
##D 
##D #-----------
##D #-- 1d: estimation with eRm package
##D 
##D # estimation with RM
##D mod1d <- eRm::RM(dat)
##D summary(mod1d)
##D 
##D # estimation person parameters
##D pp1d <- eRm::person.parameter(mod1d)
##D summary(pp1d)
##D 
##D # plot item response functions
##D eRm::plotICC(mod1d)
##D 
##D # person-item map
##D eRm::plotPImap(mod1d)
##D 
##D # item fit
##D itemf1d <- eRm::itemfit(pp1d)
##D 
##D # person fit
##D persf1d <- eRm::personfit(pp1d)
##D 
##D #-----------
##D #-- 1e: estimation with ltm package
##D 
##D # estimation with rasch
##D mod1e <- ltm::rasch(dat)
##D summary(mod1e)
##D 
##D # estimation person parameters
##D pp1e <- ltm::factor.scores(mod1e)
##D 
##D # plot item response functions
##D plot(mod1e)
##D 
##D # item fit
##D itemf1e <- ltm::item.fit(mod1e)
##D 
##D # person fit
##D persf1e <- ltm::person.fit(mod1e)
##D 
##D # goodness of fit with Bootstrap
##D modf1e <- ltm::GoF.rasch(mod1e,B=20)    # use more bootstrap samples
##D modf1e
##D 
##D #*********************************************************
##D # Model 2: 2PL model
##D #*********************************************************
##D 
##D #-----------
##D #-- 2a: estimation with TAM package
##D 
##D # estimation
##D mod2a <- TAM::tam.mml.2pl(dat)
##D summary(mod2a)
##D 
##D # model fit
##D modf2a <- TAM::tam.modelfit(mod2a)
##D summary(modf2a)
##D 
##D # item response functions
##D plot(mod2a, export=FALSE, ask=TRUE)
##D 
##D # model comparison
##D anova(mod1a,mod2a)
##D 
##D #-----------
##D #-- 2b: estimation with mirt package
##D 
##D # estimation
##D mod2b <- mirt::mirt(dat,1,itemtype="2PL")
##D summary(mod2b)
##D print(mod2b)
##D sirt::mirt.wrapper.coef(mod2b)
##D 
##D # model fit
##D modf2b <- mirt::M2(mod2b)
##D modf2b
##D 
##D #-----------
##D #-- 2c: estimation with sirt package
##D 
##D I <- ncol(dat)
##D # estimation
##D mod2c <- sirt::rasch.mml2(dat,est.a=1:I)
##D summary(mod2c)
##D 
##D # model fit
##D modf2c <- sirt::modelfit.sirt(mod2c)
##D summary(modf2c)
##D 
##D #-----------
##D #-- 2e: estimation with ltm package
##D 
##D # estimation
##D mod2e <- ltm::ltm(dat ~ z1 )
##D summary(mod2e)
##D 
##D # item response functions
##D plot(mod2e)
##D 
##D #*********************************************************
##D # Model 3: Mixture Rasch model
##D #*********************************************************
##D 
##D #-----------
##D #-- 3a: estimation with TAM package
##D 
##D # avoid "_" in column names if the "__" operator is used in
##D # the tamaan syntax
##D dat1 <- dat
##D colnames(dat1) <- gsub("_", "", colnames(dat1) )
##D # define tamaan model
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE ;
##D   NCLASSES(2);
##D   NSTARTS(20,25);   # 20 random starts with 25 initial iterations each
##D LAVAAN MODEL:
##D   F=~ Freude1__Freude2
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod3a <- TAM::tamaan( tammodel, resp=dat1 )
##D summary(mod3a)
##D # extract item parameters
##D ipars <- mod2$itempartable_MIXTURE[ 1:10, ]
##D plot( 1:10, ipars[,3], type="o", ylim=range( ipars[,3:4] ), pch=16,
##D         xlab="Item", ylab="Item difficulty")
##D lines( 1:10, ipars[,4], type="l", col=2, lty=2)
##D points( 1:10, ipars[,4],  col=2, pch=2)
##D 
##D #-----------
##D #-- 3f: estimation with psychomix package
##D 
##D # estimation
##D mod3f <- psychomix::raschmix( as.matrix(dat), k=2, scores="meanvar")
##D summary(mod3f)
##D # plot class-specific item difficulties
##D plot(mod3f)
##D 
##D #############################################################################
##D # EXAMPLES Ch. 5: Unidimensional IRT models | polytomous data
##D #############################################################################
##D 
##D data(data.eid.kap5)
##D data0 <- data.eid.kap5
##D # extract items
##D dat <- data0[,2:7]
##D 
##D #*********************************************************
##D # Model 1: Partial credit model
##D #*********************************************************
##D 
##D #-----------
##D #-- 1a: estimation with TAM package
##D 
##D # estimation with tam.mml
##D mod1a <- TAM::tam.mml(dat)
##D summary(mod1a)
##D 
##D # person parameters in TAM
##D pp1a <- tam.wle(mod1a)
##D 
##D # plot item response functions
##D plot(mod1a,export=FALSE,ask=TRUE)
##D 
##D # Infit and outfit in TAM
##D itemf1a <- TAM::tam.fit(mod1a)
##D itemf1a
##D 
##D # model fit
##D modf1a <- TAM::tam.modelfit(mod1a)
##D summary(modf1a)
##D 
##D #-----------
##D #-- 1b: estimation with mirt package
##D 
##D # estimation with tam.mml
##D mod1b <- mirt::mirt( dat, 1, itemtype="Rasch")
##D summary(mod1b)
##D print(mod1b)
##D sirt::mirt.wrapper.coef(mod1b)
##D 
##D # plot item response functions
##D plot(mod1b, type="trace" )
##D par(mfrow=c(1,1))
##D 
##D # item fit
##D itemf1b <- mirt::itemfit(mod1b)
##D itemf1b
##D 
##D #-----------
##D #-- 1c: estimation with sirt package
##D 
##D # estimation with rm.facets
##D mod1c <- sirt::rm.facets(dat)
##D summary(mod1c)
##D summary(mod1a)
##D 
##D #-----------
##D #-- 1d: estimation with eRm package
##D 
##D # estimation
##D mod1d <- eRm::PCM(dat)
##D summary(mod1d)
##D 
##D # plot item response functions
##D eRm::plotICC(mod1d)
##D 
##D # person-item map
##D eRm::plotPImap(mod1d)
##D 
##D # item fit
##D itemf1d <- eRm::itemfit(pp1d)
##D 
##D #-----------
##D #-- 1e: estimation with ltm package
##D 
##D # estimation
##D mod1e <- ltm::gpcm(dat, constraint="1PL")
##D summary(mod1e)
##D # plot item response functions
##D plot(mod1e)
##D 
##D #*********************************************************
##D # Model 2: Generalized partial credit model
##D #*********************************************************
##D 
##D #-----------
##D #-- 2a: estimation with TAM package
##D 
##D # estimation with tam.mml
##D mod2a <- TAM::tam.mml.2pl(dat, irtmodel="GPCM")
##D summary(mod2a)
##D 
##D # model fit
##D modf2a <- TAM::tam.modelfit(mod2a)
##D summary(modf2a)
##D 
##D #-----------
##D #-- 2b: estimation with mirt package
##D 
##D # estimation
##D mod2b <- mirt::mirt( dat, 1, itemtype="gpcm")
##D summary(mod2b)
##D print(mod2b)
##D sirt::mirt.wrapper.coef(mod2b)
##D 
##D #-----------
##D #-- 2c: estimation with sirt package
##D 
##D # estimation with rm.facets
##D mod2c <- sirt::rm.facets(dat, est.a.item=TRUE)
##D summary(mod2c)
##D 
##D #-----------
##D #-- 2e: estimation with ltm package
##D 
##D # estimation
##D mod2e <- ltm::gpcm(dat)
##D summary(mod2e)
##D plot(mod2e)
## End(Not run)



