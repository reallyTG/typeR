library(miceadds)


### Name: NMIwaldtest
### Title: Wald Test for Nested Multiply Imputed Datasets
### Aliases: NMIwaldtest create.designMatrices.waldtest summary.NMIwaldtest
###   MIwaldtest summary.MIwaldtest
### Keywords: Nested multiple imputation summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested multiple imputation and Wald test | TIMSS data
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D # remove first four variables
##D M <- length(datlist)
##D for (ll in 1:M){
##D     datlist[[ll]] <- datlist[[ll]][, -c(1:4) ]
##D                }
##D 
##D #***************
##D # (1) nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist,  m=3, maxit=2 )
##D summary(imp1)
##D 
##D #**** Model 1: Linear regression with interaction effects
##D res1 <- with( imp1, stats::lm( likesc ~ female*migrant + female*books  ) )
##D pres1 <- miceadds::pool.mids.nmi( res1 )
##D summary(pres1)
##D 
##D # test whether both interaction effects equals zero
##D pars <- dimnames(pres1$qhat)[[3]]
##D des <- miceadds::create.designMatrices.waldtest( pars=pars, k=2)
##D Cdes <- des$Cdes
##D rdes <- des$rdes
##D Cdes[1, "female:migrant"] <- 1
##D Cdes[2, "female:books"] <- 1
##D wres1 <- miceadds::NMIwaldtest( qhat=pres1$qhat, u=pres1$u, Cdes=Cdes, rdes=rdes )
##D summary(wres1)
##D 
##D # a simpler specification is the use of "testnull"
##D testnull <- c("female:migrant", "female:books")
##D wres1b <- miceadds::NMIwaldtest( qhat=qhat, u=u, testnull=testnull )
##D summary(wres1b)
##D 
##D #**** Model 2: Multivariate linear regression
##D res2 <- with( imp1, stats::lm( cbind( ASMMAT, ASSSCI ) ~
##D                            0 + I(1*(female==1)) + I(1*(female==0))   ) )
##D pres2 <- miceadds::pool.mids.nmi( res2 )
##D summary(pres2)
##D 
##D # test whether both gender differences equals -10 points
##D pars <- dimnames(pres2$qhat)[[3]]
##D   ##  > pars
##D   ##  [1] "ASMMAT:I(1 * (female==1))" "ASMMAT:I(1 * (female==0))"
##D   ##  [3] "ASSSCI:I(1 * (female==1))" "ASSSCI:I(1 * (female==0))"
##D 
##D des <- miceadds::create.designMatrices.waldtest( pars=pars, k=2)
##D Cdes <- des$Cdes
##D rdes <- c(-10,-10)
##D Cdes[1, "ASMMAT:I(1*(female==1))"] <- 1
##D Cdes[1, "ASMMAT:I(1*(female==0))"] <- -1
##D Cdes[2, "ASSSCI:I(1*(female==1))"] <- 1
##D Cdes[2, "ASSSCI:I(1*(female==0))"] <- -1
##D 
##D wres2 <- miceadds::NMIwaldtest( qhat=pres2$qhat, u=pres2$u, Cdes=Cdes, rdes=rdes )
##D summary(wres2)
##D 
##D # test only first hypothesis
##D wres2b <- miceadds::NMIwaldtest( qhat=pres2$qhat, u=pres2$u, Cdes=Cdes[1,,drop=FALSE],
##D                          rdes=rdes[1] )
##D summary(wres2b)
##D 
##D #############################################################################
##D # EXAMPLE 2: Multiple imputation and Wald test | TIMSS data
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D dat <- data.timss2[[1]]
##D dat <- dat[, - c(1:4) ]
##D 
##D # perform multiple imputation
##D imp <- mice::mice( dat, m=6, maxit=3 )
##D 
##D # define analysis model
##D res1 <- with( imp, lm( likesc ~ female*migrant + female*books  ) )
##D pres1 <- mice::pool( res1 )
##D summary(pres1)
##D 
##D # Wald test for zero interaction effects
##D qhat <- pres1$qhat
##D u <- pres1$u
##D pars <- dimnames(pres1$qhat)[[2]]
##D des <- miceadds::create.designMatrices.waldtest( pars=pars, k=2)
##D Cdes <- des$Cdes
##D rdes <- des$rdes
##D Cdes[1, "female:migrant"] <- 1
##D Cdes[2, "female:books"] <- 1
##D 
##D # apply MIwaldtest function
##D wres1 <- miceadds::MIwaldtest( qhat, u, Cdes, rdes )
##D summary(wres1)
##D 
##D # use again "testnull"
##D testnull <- c("female:migrant", "female:books")
##D wres1b <- miceadds::MIwaldtest( qhat=qhat, u=u, testnull=testnull )
##D summary(wres1b)
##D 
##D #***** linear regression with cluster robust standard errors
##D 
##D # convert object of class mids into a list object
##D datlist_imp <- miceadds::mids2datlist( imp )
##D # define cluster
##D idschool <- as.numeric( substring( data.timss2[[1]]$IDSTUD, 1, 5 ) )
##D # linear regression
##D res2 <- lapply( datlist_imp, FUN=function(data){
##D            miceadds::lm.cluster( data=data, formula=likesc ~ female*migrant + female*books,
##D                             cluster=idschool ) } )
##D # extract parameters and covariance matrix
##D qhat <- lapply( res2, FUN=function(rr){ coef(rr) } )
##D u <- lapply( res2, FUN=function(rr){ vcov(rr) } )
##D # perform Wald test
##D wres2 <- miceadds::MIwaldtest( qhat, u, Cdes, rdes )
##D summary(wres2)
## End(Not run)



