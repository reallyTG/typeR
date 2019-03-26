library(sirt)


### Name: linking.haberman
### Title: Linking in the 2PL/Generalized Partial Credit Model
### Aliases: linking.haberman summary.linking.haberman
### Keywords: Linking Equating

### ** Examples

#############################################################################
# EXAMPLE 1: Item parameters data.pars1.rasch and data.pars1.2pl
#############################################################################

# Model 1: Linking three studies calibrated by the Rasch model
data(data.pars1.rasch)
mod1 <- sirt::linking.haberman( itempars=data.pars1.rasch )
summary(mod1)

# Model 1b: Linking these studies but weigh these studies by
#     proportion weights 3 : 0.5 : 1  (see below).
#     All weights are the same for each item but they could also
#     be item specific.
itempars <- data.pars1.rasch
itempars$wgt <- 1
itempars[ itempars$study=="study1","wgt"] <- 3
itempars[ itempars$study=="study2","wgt"] <- .5
mod1b <- sirt::linking.haberman( itempars=itempars )
summary(mod1b)

# Model 2: Linking three studies calibrated by the 2PL model
data(data.pars1.2pl)
mod2 <- sirt::linking.haberman( itempars=data.pars1.2pl )
summary(mod2)

# additive model instaed of logarithmic model for item slopes
mod2b <- sirt::linking.haberman( itempars=data.pars1.2pl, a_log=FALSE )
summary(mod2b)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Linking longitudinal data
##D #############################################################################
##D data(data.long)
##D 
##D #******
##D # Model 1: Scaling with the 1PL model
##D 
##D # scaling at T1
##D dat1 <- data.long[, grep("T1", colnames(data.long) ) ]
##D resT1 <- sirt::rasch.mml2( dat1 )
##D itempartable1 <- data.frame( "study"="T1", resT1$item[, c("item", "a", "b" ) ] )
##D # scaling at T2
##D dat2 <- data.long[, grep("T2", colnames(data.long) ) ]
##D resT2 <- sirt::rasch.mml2( dat2 )
##D summary(resT2)
##D itempartable2 <- data.frame( "study"="T2", resT2$item[, c("item", "a", "b" ) ] )
##D itempartable <- rbind( itempartable1, itempartable2 )
##D itempartable[,2] <- substring( itempartable[,2], 1, 2 )
##D # estimate linking parameters
##D mod1 <- sirt::linking.haberman( itempars=itempartable )
##D 
##D #******
##D # Model 2: Scaling with the 2PL model
##D 
##D # scaling at T1
##D dat1 <- data.long[, grep("T1", colnames(data.long) ) ]
##D resT1 <- sirt::rasch.mml2( dat1, est.a=1:6)
##D itempartable1 <- data.frame( "study"="T1", resT1$item[, c("item", "a", "b" ) ] )
##D 
##D # scaling at T2
##D dat2 <- data.long[, grep("T2", colnames(data.long) ) ]
##D resT2 <- sirt::rasch.mml2( dat2, est.a=1:6)
##D summary(resT2)
##D itempartable2 <- data.frame( "study"="T2", resT2$item[, c("item", "a", "b" ) ] )
##D itempartable <- rbind( itempartable1, itempartable2 )
##D itempartable[,2] <- substring( itempartable[,2], 1, 2 )
##D # estimate linking parameters
##D mod2 <- sirt::linking.haberman( itempars=itempartable )
##D 
##D #############################################################################
##D # EXAMPLE 3: 2 Studies - 1PL and 2PL linking
##D #############################################################################
##D set.seed(789)
##D I <- 20        # number of items
##D N <- 2000       # number of persons
##D # define item parameters
##D b <- seq( -1.5, 1.5, length=I )
##D # simulate data
##D dat1 <- sirt::sim.raschtype( stats::rnorm( N, mean=0,sd=1 ), b=b )
##D dat2 <- sirt::sim.raschtype( stats::rnorm( N, mean=0.5,sd=1.50 ), b=b )
##D 
##D #*** Model 1: 1PL
##D # 1PL Study 1
##D mod1 <- sirt::rasch.mml2( dat1, est.a=rep(1,I) )
##D summary(mod1)
##D # 1PL Study 2
##D mod2 <- sirt::rasch.mml2( dat2, est.a=rep(1,I) )
##D summary(mod2)
##D 
##D # collect item parameters
##D dfr1 <- data.frame( "study1", mod1$item$item, mod1$item$a, mod1$item$b )
##D dfr2 <- data.frame( "study2", mod2$item$item, mod2$item$a, mod2$item$b )
##D colnames(dfr2) <- colnames(dfr1) <- c("study", "item", "a", "b" )
##D itempars <- rbind( dfr1, dfr2 )
##D 
##D # Haberman linking
##D linkhab1 <- sirt::linking.haberman(itempars=itempars)
##D   ## Transformation parameters (Haberman linking)
##D   ##    study    At     Bt
##D   ## 1 study1 1.000  0.000
##D   ## 2 study2 1.465 -0.512
##D   ##
##D   ## Linear transformation for item parameters a and b
##D   ##    study   A_a   A_b    B_b
##D   ## 1 study1 1.000 1.000  0.000
##D   ## 2 study2 0.682 1.465 -0.512
##D   ##
##D   ## Linear transformation for person parameters theta
##D   ##    study A_theta B_theta
##D   ## 1 study1   1.000   0.000
##D   ## 2 study2   1.465   0.512
##D   ##
##D   ## R-Squared Measures of Invariance
##D   ##        slopes intercepts
##D   ## R2          1     0.9979
##D   ## sqrtU2      0     0.0456
##D 
##D #*** Model 2: 2PL
##D # 2PL Study 1
##D mod1 <- sirt::rasch.mml2( dat1, est.a=1:I )
##D summary(mod1)
##D # 2PL Study 2
##D mod2 <- sirt::rasch.mml2( dat2, est.a=1:I )
##D summary(mod2)
##D 
##D # collect item parameters
##D dfr1 <- data.frame( "study1", mod1$item$item, mod1$item$a, mod1$item$b )
##D dfr2 <- data.frame( "study2", mod2$item$item, mod2$item$a, mod2$item$b )
##D colnames(dfr2) <- colnames(dfr1) <- c("study", "item", "a", "b" )
##D itempars <- rbind( dfr1, dfr2 )
##D 
##D # Haberman linking
##D linkhab2 <- sirt::linking.haberman(itempars=itempars)
##D   ## Transformation parameters (Haberman linking)
##D   ##    study    At     Bt
##D   ## 1 study1 1.000  0.000
##D   ## 2 study2 1.468 -0.515
##D   ##
##D   ## Linear transformation for item parameters a and b
##D   ##    study   A_a   A_b    B_b
##D   ## 1 study1 1.000 1.000  0.000
##D   ## 2 study2 0.681 1.468 -0.515
##D   ##
##D   ## Linear transformation for person parameters theta
##D   ##    study A_theta B_theta
##D   ## 1 study1   1.000   0.000
##D   ## 2 study2   1.468   0.515
##D   ##
##D   ## R-Squared Measures of Invariance
##D   ##        slopes intercepts
##D   ## R2     0.9984     0.9980
##D   ## sqrtU2 0.0397     0.0443
##D 
##D #############################################################################
##D # EXAMPLE 4: 3 Studies - 1PL and 2PL linking
##D #############################################################################
##D set.seed(789)
##D I <- 20         # number of items
##D N <- 1500       # number of persons
##D # define item parameters
##D b <- seq( -1.5, 1.5, length=I )
##D # simulate data
##D dat1 <- sirt::sim.raschtype( stats::rnorm( N, mean=0,sd=1 ), b=b )
##D dat2 <- sirt::sim.raschtype( stats::rnorm( N, mean=0.5,sd=1.50 ), b=b )
##D dat3 <- sirt::sim.raschtype( stats::rnorm( N, mean=-.2,sd=.8 ), b=b )
##D # set some items to non-administered
##D dat3 <- dat3[, -c(1,4) ]
##D dat2 <- dat2[, -c(1,2,3) ]
##D 
##D #*** Model 1: 1PL in sirt
##D # 1PL Study 1
##D mod1 <- sirt::rasch.mml2( dat1, est.a=rep(1,ncol(dat1)) )
##D summary(mod1)
##D # 1PL Study 2
##D mod2 <- sirt::rasch.mml2( dat2, est.a=rep(1,ncol(dat2)) )
##D summary(mod2)
##D # 1PL Study 3
##D mod3 <- sirt::rasch.mml2( dat3, est.a=rep(1,ncol(dat3)) )
##D summary(mod3)
##D 
##D # collect item parameters
##D dfr1 <- data.frame( "study1", mod1$item$item, mod1$item$a, mod1$item$b )
##D dfr2 <- data.frame( "study2", mod2$item$item, mod2$item$a, mod2$item$b )
##D dfr3 <- data.frame( "study3", mod3$item$item, mod3$item$a, mod3$item$b )
##D colnames(dfr3) <- colnames(dfr2) <- colnames(dfr1) <- c("study", "item", "a", "b" )
##D itempars <- rbind( dfr1, dfr2, dfr3 )
##D 
##D # use person parameters
##D personpars <- list( mod1$person[, c("EAP","SE.EAP") ], mod2$person[, c("EAP","SE.EAP") ],
##D     mod3$person[, c("EAP","SE.EAP") ] )
##D 
##D # Haberman linking
##D linkhab1 <- sirt::linking.haberman(itempars=itempars, personpars=personpars)
##D # compare item parameters
##D round( cbind( linkhab1$joint.itempars[,-1], linkhab1$b.trans )[1:5,], 3 )
##D   ##            aj     bj study1 study2 study3
##D   ##   I0001 0.998 -1.427 -1.427     NA     NA
##D   ##   I0002 0.998 -1.290 -1.324     NA -1.256
##D   ##   I0003 0.998 -1.140 -1.068     NA -1.212
##D   ##   I0004 0.998 -0.986 -1.003 -0.969     NA
##D   ##   I0005 0.998 -0.869 -0.809 -0.872 -0.926
##D 
##D # summary of person parameters of second study
##D round( psych::describe( linkhab1$personpars[[2]] ), 2 )
##D   ##   var    n mean   sd median trimmed  mad   min  max range  skew kurtosis
##D   ## EAP      1 1500 0.45 1.36   0.41    0.47 1.52 -2.61 3.25  5.86 -0.08    -0.62
##D   ## SE.EAP   2 1500 0.57 0.09   0.53    0.56 0.04  0.49 0.84  0.35  1.47     1.56
##D   ##          se
##D   ## EAP    0.04
##D   ## SE.EAP 0.00
##D 
##D #*** Model 2: 2PL in TAM
##D library(TAM)
##D # 2PL Study 1
##D mod1 <- TAM::tam.mml.2pl( resp=dat1, irtmodel="2PL" )
##D pvmod1 <- TAM::tam.pv(mod1, ntheta=300, normal.approx=TRUE) # draw plausible values
##D summary(mod1)
##D # 2PL Study 2
##D mod2 <- TAM::tam.mml.2pl( resp=dat2, irtmodel="2PL" )
##D pvmod2 <- TAM::tam.pv(mod2, ntheta=300, normal.approx=TRUE)
##D summary(mod2)
##D # 2PL Study 3
##D mod3 <- TAM::tam.mml.2pl( resp=dat3, irtmodel="2PL" )
##D pvmod3 <- TAM::tam.pv(mod3, ntheta=300, normal.approx=TRUE)
##D summary(mod3)
##D 
##D # collect item parameters
##D #!!  Note that in TAM the parametrization is a*theta - b while linking.haberman
##D #!!  needs the parametrization a*(theta-b)
##D dfr1 <- data.frame( "study1", mod1$item$item, mod1$B[,2,1], mod1$xsi$xsi / mod1$B[,2,1] )
##D dfr2 <- data.frame( "study2", mod2$item$item, mod2$B[,2,1], mod2$xsi$xsi / mod2$B[,2,1] )
##D dfr3 <- data.frame( "study3", mod3$item$item, mod3$B[,2,1], mod3$xsi$xsi / mod3$B[,2,1] )
##D colnames(dfr3) <- colnames(dfr2) <- colnames(dfr1) <- c("study", "item", "a", "b" )
##D itempars <- rbind( dfr1, dfr2, dfr3 )
##D 
##D # define list containing person parameters
##D personpars <- list(  pvmod1$pv[,-1], pvmod2$pv[,-1], pvmod3$pv[,-1] )
##D 
##D # Haberman linking
##D linkhab2 <- sirt::linking.haberman(itempars=itempars,personpars=personpars)
##D   ##   Linear transformation for person parameters theta
##D   ##      study A_theta B_theta
##D   ##   1 study1   1.000   0.000
##D   ##   2 study2   1.485   0.465
##D   ##   3 study3   0.786  -0.192
##D 
##D # extract transformed person parameters
##D personpars.trans <- linkhab2$personpars
##D 
##D #############################################################################
##D # EXAMPLE 5: Linking with simulated item parameters containing outliers
##D #############################################################################
##D 
##D # simulate some parameters
##D I <- 38
##D set.seed(18785)
##D b <- stats::rnorm( I, mean=.3, sd=1.4 )
##D # simulate DIF effects plus some outliers
##D bdif <- stats::rnorm(I,mean=.4,sd=.09)+( stats::runif(I)>.9 )* rep( 1*c(-1,1)+.4, each=I/2 )
##D # create item parameter table
##D itempars <- data.frame( "study"=paste0("study",rep(1:2, each=I)),
##D                 "item"=paste0( "I", 100 + rep(1:I,2) ), "a"=1,
##D                  "b"=c( b, b + bdif  )  )
##D 
##D #*** Model 1: Haberman linking with least squares regression
##D mod1 <- sirt::linking.haberman( itempars=itempars )
##D summary(mod1)
##D 
##D #*** Model 2: Haberman linking with robust bisquare regression
##D mod2 <- sirt::linking.haberman( itempars=itempars2, b_trim=.4, maxiter=20)
##D summary(mod2)
## End(Not run)



