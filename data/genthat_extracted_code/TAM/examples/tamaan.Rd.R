library(TAM)


### Name: tamaan
### Title: Wrapper Function for 'TAM' Language
### Aliases: tamaan summary.tamaan print.tamaan
### Keywords: Model specification TAM language

### ** Examples

#############################################################################
# EXAMPLE 1: Examples dichotomous data data.read
#############################################################################

library(sirt)
data(data.read,package="sirt")
dat <- data.read

#*********************************************************************
#*** Model 1: Rasch model

tammodel <- "
LAVAAN MODEL:
  F1=~ A1__C4
  F1 ~~ F1
ITEM TYPE:
  ALL(Rasch);
    "
# estimate model
mod1 <- TAM::tamaan( tammodel, resp=dat)
summary(mod1)

## Not run: 
##D #*********************************************************************
##D #*** Model 2: 2PL model with some selected items
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   F1=~ A1__B1 + B3 + C1__C3
##D   F1 ~~ F1
##D     "
##D mod2 <- TAM::tamaan( tammodel, resp=dat)
##D summary(mod2)
##D 
##D #*********************************************************************
##D #*** Model 3: Multidimensional IRT model
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   G=~ A1__C4
##D   F1=~ A1__B4
##D   F2=~ C1__C4
##D   F1 ~~ F2
##D   # specify fixed entries in covariance matrix
##D   F1 ~~ 1*F1
##D   F2 ~~ 1*F2
##D   G  ~~ 0*F1
##D   G  ~~ 0.3*F2
##D   G  ~~ 0.7*G
##D     "
##D mod3 <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=30))
##D summary(mod3)
##D 
##D #*********************************************************************
##D #*** Model 4: Some linear constraints for item slopes and intercepts
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   F=~ lam1__lam10*A1__C2
##D   F=~ 0.78*C3
##D   F ~~ F
##D   A1 | a1*t1
##D   A2 | a2*t1
##D   A3 | a3*t1
##D   A4 | a4*t1
##D   B1 | b1*t1
##D   B2 | b2*t1
##D   B3 | b3*t1
##D   C1 | t1
##D MODEL CONSTRAINT:
##D   # defined parameters
##D   # only linear combinations are permitted
##D   b2==1.3*b1 + (-0.6)*b3
##D   a1==q1
##D   a2==q2 + t
##D   a3==q1 + 2*t
##D   a4==q2 + 3*t
##D   # linear constraints for loadings
##D   lam2==1.1*lam1
##D   lam3==0.9*lam1 + (-.1)*lam0
##D   lam8==lam0
##D   lam9==lam0
##D     "
##D mod4 <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=5) )
##D summary(mod4)
##D 
##D #*********************************************************************
##D #*** Model 5: Latent class analysis with three classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(3);   # 3 classes
##D   NSTARTS(5,20); # 5 random starts with 20 iterations
##D LAVAAN MODEL:
##D   F=~ A1__C4
##D     "
##D mod5 <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=100)  )
##D summary(mod5)
##D 
##D #*********************************************************************
##D #*** Model 6: Ordered latent class analysis with three classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=OLCA;
##D   NCLASSES(3);    # 3 classes
##D   NSTARTS(20,40); # 20 random starts with 40 iterations
##D LAVAAN MODEL:
##D   F=~ A1__C4
##D     "
##D mod6 <- TAM::tamaan( tammodel, dat )
##D summary(mod6)
##D 
##D #*********************************************************************
##D #*** Model 7: Unidimensional located latent class model with three classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LOCLCA;
##D   NCLASSES(3)
##D   NSTARTS(10,40)
##D LAVAAN MODEL:
##D   F=~ A1__C4
##D   B2 | 0*t1
##D     "
##D mod7 <- TAM::tamaan( tammodel, resp=dat)
##D summary(mod7)
##D 
##D #*********************************************************************
##D #*** Model 8: Two-dimensional located latent class analysis with some
##D #             priors and equality constraints among thresholds
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LOCLCA;
##D   NCLASSES(4);
##D   NSTARTS(10,20);
##D LAVAAN MODEL:
##D   AB=~ A1__B4
##D   C=~ C1__C4
##D   A1 | a1diff*t1
##D   B2 | 0*t1
##D   C2 | 0*t1
##D   B1 | a1diff*t1
##D MODEL PRIOR:
##D   # prior distributions for cluster locations
##D   DO2(1,4,1,1,2,1)
##D     Cl%1_Dim%2 ~ N(0,2);
##D   DOEND
##D     "
##D # estimate model
##D mod8 <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod8)
##D 
##D #*********************************************************************
##D #*** Model 9: Two-dimensional model with constraints on parameters
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   FA=~ A1+b*A2+A3+d*A4
##D   FB=~ B1+b*B2+B3+d*B4
##D   FA ~~ 1*FA
##D   FA ~~ FB
##D   FB ~~ 1*FB
##D   A1 | c*t1
##D   B1 | c*t1
##D   A2 | .7*t1
##D     "
##D # estimate model
##D mod9 <- TAM::tamaan( tammodel, resp=dat, control=list(maxiter=30) )
##D summary(mod9)
##D 
##D #############################################################################
##D # EXAMPLE 2: Examples polytomous data | data.Students
##D #############################################################################
##D 
##D library(CDM)
##D data( data.Students, package="CDM")
##D dat <- data.Students[,3:13]
##D   ##   > colnames(dat)
##D   ##    [1] "act1" "act2" "act3" "act4" "act5" "sc1"  "sc2"  "sc3"  "sc4"  "mj1"  "mj2"
##D 
##D #*********************************************************************
##D #*** Model 1: Two-dimensional generalized partial credit model
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   FA=~ act1__act5
##D   FS=~ sc1__sc4
##D   FA ~~ 1*FA
##D   FS ~~ 1*FS
##D   FA ~~ FS
##D     "
##D # estimate model
##D mod1 <- TAM::tamaan( tammodel, dat, control=list(maxiter=10)  )
##D summary(mod1)
##D 
##D #*********************************************************************
##D #*** Model 2: Two-dimensional model, some constraints
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   FA=~ a1__a4*act1__act4 + 0.89*act5
##D   FS=~ 1*sc1 + sc2__sc4
##D   FA ~~ FA
##D   FS ~~ FS
##D   FA ~~ FS
##D   # some equality constraints
##D   act1 + act3 | a13_t1 * t1
##D   act1 + act3 | a13_t2 * t2
##D     "
##D # only create design matrices with tamaanify
##D mod2 <- TAM::tamaanify( tammodel, dat  )
##D mod2$lavpartable
##D # estimate model (only few iterations as a test)
##D mod2 <- TAM::tamaan( tammodel, dat, control=list(maxiter=10)  )
##D summary(mod2)
##D 
##D #*********************************************************************
##D #*** Model 3: Two-dimensional model, some more linear constraints
##D 
##D tammodel <- "
##D LAVAAN MODEL:
##D   FA=~ a1__a5*act1__act5
##D   FS=~ b1__b4*sc1__sc4
##D   FA ~~ 1*FA
##D   FA ~~ FS
##D   FS ~~ 1*FS
##D   act1 + act3 | a13_t1 * t1
##D   act1 + act3 | a13_t2 * t2
##D MODEL CONSTRAINT:
##D   a1==q0
##D   a2==q0
##D   a3==q0    + q1
##D   a4==q2
##D   a5==q2 + q1
##D     "
##D # estimate
##D mod3 <- TAM::tamaan( tammodel, dat, control=list(maxiter=300 )  )
##D summary(mod3)
##D 
##D #*********************************************************************
##D #*** Model 4: Latent class analysis with three latent classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(3);    # 3 classes
##D   NSTARTS(10,30); # 10 random starts with 30 iterations
##D LAVAAN MODEL:
##D   F=~ act1__act5
##D     "
##D # estimate model
##D mod4 <- TAM::tamaan( tammodel, resp=dat)
##D summary(mod4)
##D 
##D #*********************************************************************
##D #*** Model 5: Partial credit model with "PCM2" parametrization
##D 
##D # select data
##D dat1 <- dat[, paste0("act",1:5) ]
##D # specify tamaan model
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F=~ act1__act5
##D     F ~~ F
##D     # use DO statement as shortages
##D     DO(1,5,1)
##D       act% | b%_1 * t1
##D       act% | b%_2 * t2
##D     DOEND
##D   MODEL CONSTRAINT:
##D     DO(1,5,1)
##D       b%_1==delta% + tau%_1
##D       b%_2==2*delta%
##D     DOEND
##D   ITEM TYPE:
##D     ALL(PCM)
##D   "
##D # estimate model
##D mod5 <- TAM::tamaan( tammodel, dat1 )
##D summary(mod5)
##D # compare with PCM2 parametrization in tam.mml
##D mod5b <- TAM::tam.mml( dat1, irtmodel="PCM2" )
##D summary(mod5b)
##D 
##D #*********************************************************************
##D #*** Model 6: Rating scale model
##D 
##D # select data
##D dat1 <- dat[, paste0("sc",1:4) ]
##D psych::describe(dat1)
##D 
##D # specify tamaan model
##D tammodel <- "
##D   LAVAAN MODEL:
##D     F=~ sc1__sc4
##D     F ~~ F
##D     # use DO statement as shortages
##D     DO(1,4,1)
##D       sc% | b%_1 * t1
##D       sc% | b%_2 * t2
##D       sc% | b%_3 * t3
##D     DOEND
##D   MODEL CONSTRAINT:
##D     DO(1,4,1)
##D       b%_1==delta% + step1
##D       b%_2==2*delta% + step1 + step2
##D       b%_3==3*delta%
##D     DOEND
##D   ITEM TYPE:
##D     ALL(PCM)
##D   "
##D # estimate model
##D mod6 <- TAM::tamaan( tammodel, dat1 )
##D summary(mod6)
##D # compare with RSM in tam.mml
##D mod6b <- TAM::tam.mml( dat1, irtmodel="RSM" )
##D summary(mod6b)
##D 
##D #*********************************************************************
##D #*** Model 7: Partial credit model with Fourier basis for
##D #             item intercepts (Thissen, Cai & Bock, 2010)
##D # see ?tamaanify manual
##D 
##D # define tamaan model
##D tammodel <- "
##D LAVAAN MODEL:
##D    mj=~ mj1__mj4
##D    mj ~~ 1*mj
##D ITEM TYPE:
##D   mj1(PCM,2)
##D   mj2(PCM,3)
##D   mj3(PCM)
##D   mj4(PCM,1)
##D    "
##D # estimate model
##D mod7 <- TAM::tamaan( tammodel, dat )
##D summary(mod7)
##D # -> This function can also be applied for the generalized partial credit
##D #    model (GPCM).
##D 
##D #############################################################################
##D # EXAMPLE 3: Rasch model and mixture Rasch model (Geiser & Eid, 2010)
##D #############################################################################
##D 
##D data(data.geiser, package="TAM")
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
## End(Not run)



