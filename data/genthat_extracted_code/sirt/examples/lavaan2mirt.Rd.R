library(sirt)


### Name: lavaan2mirt
### Title: Converting a 'lavaan' Model into a 'mirt' Model
### Aliases: lavaan2mirt
### Keywords: mirt lavaan

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Convert some lavaan syntax to mirt syntax for data.read
##D #############################################################################
##D 
##D library(mirt)
##D data(data.read)
##D dat <- data.read
##D 
##D #******************
##D #*** Model 1: Single factor model
##D lavmodel <- "
##D      # omit item C3
##D      F=~ A1+A2+A3+A4 + C1+C2+C4 + B1+B2+B3+B4
##D      F ~~ 1*F
##D             "
##D 
##D # convert syntax and estimate model
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D # inspect coefficients
##D coef(res$mirt)
##D mirt.wrapper.coef(res$mirt)
##D # converted mirt model and parameter table
##D cat(res$mirt.syntax)
##D res$mirt.pars
##D 
##D #******************
##D #*** Model 2: Rasch Model with first six items
##D lavmodel <- "
##D      F=~ a*A1+a*A2+a*A3+a*A4+a*B1+a*B2
##D      F ~~ 1*F
##D             "
##D # convert syntax and estimate model
##D res <- sirt::lavaan2mirt( dat,  lavmodel, est.mirt=FALSE)
##D # converted mirt model
##D cat(res$mirt.syntax)
##D # mirt parameter table
##D res$mirt.pars
##D # estimate model using generated objects
##D res2 <- mirt::mirt( res$dat, res$mirt.model, pars=res$mirt.pars )
##D mirt.wrapper.coef(res2)     # parameter estimates
##D 
##D #******************
##D #*** Model 3: Bifactor model
##D lavmodel <- "
##D      G=~ A1+A2+A3+A4 + B1+B2+B3+B4  + C1+C2+C3+C4
##D      A=~ A1+A2+A3+A4
##D      B=~ B1+B2+B3+B4
##D      C=~ C1+C2+C3+C4
##D      G ~~ 1*G
##D      A ~~ 1*A
##D      B ~~ 1*B
##D      C ~~ 1*C
##D             "
##D res <- sirt::lavaan2mirt( dat,  lavmodel, est.mirt=FALSE )
##D # mirt syntax and mirt model
##D cat(res$mirt.syntax)
##D res$mirt.model
##D res$mirt.pars
##D 
##D #******************
##D #*** Model 4: 3-dimensional model with some parameter constraints
##D lavmodel <- "
##D      # some equality constraints among loadings
##D      A=~ a*A1+a*A2+a2*A3+a2*A4
##D      B=~ B1+B2+b3*B3+B4
##D      C=~ c*C1+c*C2+c*C3+c*C4
##D      # some equality constraints among thresholds
##D      A1 | da*t1
##D      A3 | da*t1
##D      B3 | da*t1
##D      C3 | dg*t1
##D      C4 | dg*t1
##D      # standardized latent variables
##D      A ~~ 1*A
##D      B ~~ 1*B
##D      C ~~ 1*C
##D      # estimate Cov(A,B) and Cov(A,C)
##D      A ~~ B
##D      A ~~ C
##D      # estimate mean of B
##D      B ~ 1
##D             "
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D # estimated parameters
##D mirt.wrapper.coef(res$mirt)
##D # generated mirt syntax
##D cat(res$mirt.syntax)
##D # mirt parameter table
##D mirt::mod2values(res$mirt)
##D 
##D #******************
##D #*** Model 5: 3-dimensional model with some parameter constraints and
##D #             parameter fixings
##D lavmodel <- "
##D      A=~ a*A1+a*A2+1.3*A3+A4  # set loading of A3 to 1.3
##D      B=~ B1+1*B2+b3*B3+B4
##D      C=~ c*C1+C2+c*C3+C4
##D      A1 | da*t1
##D      A3 | da*t1
##D      C4 | dg*t1
##D      B1 | 0*t1
##D      B3 | -1.4*t1   # fix item threshold of B3 to -1.4
##D      A ~~ 1*A
##D      B ~~ B         # estimate variance of B freely
##D      C ~~ 1*C
##D      A ~~ B         # estimate covariance between A and B
##D      A ~~ .6 * C    # fix covariance to .6
##D      A ~ .5*1       # set mean of A to .5
##D      B ~ 1          # estimate mean of B
##D             "
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D mirt.wrapper.coef(res$mirt)
##D 
##D #******************
##D #*** Model 6: 1-dimensional model with guessing and slipping parameters
##D #******************
##D 
##D lavmodel <- "
##D      F=~ c*A1+c*A2+1*A3+1.3*A4 + C1__C4 + a*B1+b*B2+b*B3+B4
##D      # guessing parameters
##D      A1+A2 ?=guess1*g1
##D      A3 ?=.25*g1
##D      B1+C1 ?=g1
##D      B2__B4 ?=0.10*g1
##D      # slipping parameters
##D      A1+A2+C3 ?=slip1*s1
##D      A3 ?=.02*s1
##D      # fix item intercepts
##D      A1 | 0*t1
##D      A2 | -.4*t1
##D      F ~ 1    # estimate mean of F
##D      F ~~ 1*F   # fix variance of F
##D             "
##D # convert syntax and estimate model
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D # coefficients
##D mirt.wrapper.coef(res$mirt)
##D # converted mirt model
##D cat(res$mirt.syntax)
##D 
##D #############################################################################
##D # EXAMPLE 2: Convert some lavaan syntax to mirt syntax for
##D #            longitudinal data data.long
##D #############################################################################
##D 
##D data(data.long)
##D dat <- data.long[,-1]
##D 
##D #******************
##D #*** Model 1: Rasch model for T1
##D lavmodel <- "
##D      F=~ 1*I1T1 +1*I2T1+1*I3T1+1*I4T1+1*I5T1+1*I6T1
##D      F ~~ F
##D             "
##D # convert syntax and estimate model
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=20) )
##D # inspect coefficients
##D mirt.wrapper.coef(res$mirt)
##D # converted mirt model
##D cat(res$mirt.syntax)
##D 
##D #******************
##D #*** Model 2: Rasch model for two time points
##D lavmodel <- "
##D      F1=~ 1*I1T1 +1*I2T1+1*I3T1+1*I4T1+1*I5T1+1*I6T1
##D      F2=~ 1*I3T2 +1*I4T2+1*I5T2+1*I6T2+1*I7T2+1*I8T2
##D      F1 ~~ F1
##D      F1 ~~ F2
##D      F2 ~~ F2
##D      # equal item difficulties of same items
##D      I3T1 | i3*t1
##D      I3T2 | i3*t1
##D      I4T1 | i4*t1
##D      I4T2 | i4*t1
##D      I5T1 | i5*t1
##D      I5T2 | i5*t1
##D      I6T1 | i6*t1
##D      I6T2 | i6*t1
##D      # estimate mean of F1, but fix mean of F2
##D      F1 ~ 1
##D      F2 ~ 0*1
##D             "
##D # convert syntax and estimate model
##D res <- sirt::lavaan2mirt( dat,  lavmodel, verbose=TRUE, technical=list(NCYCLES=20) )
##D # inspect coefficients
##D mirt.wrapper.coef(res$mirt)
##D # converted mirt model
##D cat(res$mirt.syntax)
##D 
##D #-- compare estimation with smirt function
##D # define Q-matrix
##D I <- ncol(dat)
##D Q <- matrix(0,I,2)
##D Q[1:6,1] <- 1
##D Q[7:12,2] <- 1
##D rownames(Q) <- colnames(dat)
##D colnames(Q) <- c("T1","T2")
##D # vector with same items
##D itemnr <- as.numeric( substring( colnames(dat),2,2) )
##D # fix mean at T2 to zero
##D mu.fixed <- cbind( 2,0 )
##D # estimate model in smirt
##D mod1 <- sirt::smirt(dat, Qmatrix=Q, irtmodel="comp", est.b=itemnr, mu.fixed=mu.fixed )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Converting lavaan syntax for polytomous data
##D #############################################################################
##D 
##D data(data.big5)
##D # select some items
##D items <- c( grep( "O", colnames(data.big5), value=TRUE )[1:6],
##D             grep( "N", colnames(data.big5), value=TRUE )[1:4] )
##D #  O3  O8  O13 O18 O23 O28 N1  N6  N11 N16
##D dat <- data.big5[, items ]
##D library(psych)
##D psych::describe(dat)
##D 
##D #******************
##D #*** Model 1: Partial credit model
##D lavmodel <- "
##D       O=~ 1*O3+1*O8+1*O13+1*O18+1*O23+1*O28
##D       O ~~ O
##D          "
##D # estimate model in mirt
##D res <- sirt::lavaan2mirt( dat, lavmodel, technical=list(NCYCLES=20), verbose=TRUE)
##D # estimated mirt model
##D mres <- res$mirt
##D # mirt syntax
##D cat(res$mirt.syntax)
##D   ##   O=1,2,3,4,5,6
##D   ##   COV=O*O
##D # estimated parameters
##D mirt.wrapper.coef(mres)
##D # some plots
##D mirt::itemplot( mres, 3 )   # third item
##D plot(mres)   # item information
##D plot(mres,type="trace")  # item category functions
##D 
##D # graded response model with equal slopes
##D res1 <- sirt::lavaan2mirt( dat, lavmodel, poly.itemtype="graded", technical=list(NCYCLES=20),
##D               verbose=TRUE )
##D mirt.wrapper.coef(res1$mirt)
##D 
##D #******************
##D #*** Model 2: Generalized partial credit model with some constraints
##D lavmodel <- "
##D       O=~ O3+O8+O13+a*O18+a*O23+1.2*O28
##D       O ~ 1   # estimate mean
##D       O ~~ O  # estimate variance
##D       # some constraints among thresholds
##D       O3  | d1*t1
##D       O13 | d1*t1
##D       O3  | d2*t2
##D       O8  | d3*t2
##D       O28 | (-0.5)*t1
##D          "
##D # estimate model in mirt
##D res <- sirt::lavaan2mirt( dat, lavmodel, technical=list(NCYCLES=5), verbose=TRUE)
##D # estimated mirt model
##D mres <- res$mirt
##D # estimated parameters
##D mirt.wrapper.coef(mres)
##D 
##D #*** generate syntax for mirt for this model and estimate it in mirt package
##D # Items: O3  O8  O13 O18 O23 O28
##D mirtmodel <- mirt::mirt.model( "
##D              O=1-6
##D              # a(O18)=a(O23), t1(O3)=t1(O18), t2(O3)=t2(O8)
##D              CONSTRAIN=(4,5,a1), (1,3,d1), (1,2,d2)
##D              MEAN=O
##D              COV=O*O
##D                ")
##D # initial table of parameters in mirt
##D mirt.pars <- mirt::mirt( dat[,1:6], mirtmodel, itemtype="gpcm", pars="values")
##D # fix slope of item O28 to 1.2
##D ind <- which( ( mirt.pars$item=="O28" ) & ( mirt.pars$name=="a1") )
##D mirt.pars[ ind, "est"] <- FALSE
##D mirt.pars[ ind, "value"] <- 1.2
##D # fix d1 of item O28 to -0.5
##D ind <- which( ( mirt.pars$item=="O28" ) & ( mirt.pars$name=="d1") )
##D mirt.pars[ ind, "est"] <- FALSE
##D mirt.pars[ ind, "value"] <- -0.5
##D # estimate model
##D res2 <- mirt::mirt( dat[,1:6], mirtmodel, pars=mirt.pars,
##D              verbose=TRUE, technical=list(NCYCLES=4) )
##D mirt.wrapper.coef(res2)
##D plot(res2, type="trace")
## End(Not run)



