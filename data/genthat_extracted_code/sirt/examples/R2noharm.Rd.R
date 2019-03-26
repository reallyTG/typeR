library(sirt)


### Name: R2noharm
### Title: Estimation of a NOHARM Analysis from within R
### Aliases: R2noharm summary.R2noharm
### Keywords: NOHARM summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Data data.noharm18 with 18 items
##D #############################################################################
##D 
##D # load data
##D data( data.noharm18 )
##D dat <- data.noharm18
##D I <- ncol(dat) # number of items
##D 
##D # locate noharm.path
##D noharm.path <- "c:/NOHARM"
##D 
##D #****************************************
##D # Model 1: 1-dimensional Rasch model (1-PL model)
##D 
##D # estimate one factor variance
##D P.pattern <- matrix( 1, ncol=1, nrow=1 )
##D P.init <- P.pattern
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 0, nrow=I, ncol=1 )
##D F.init <- 1 + 0*F.pattern       #
##D # estimate model
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",
##D            F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D            P.init=P.init, writename="ex1__1dim_1pl",
##D        noharm.path=noharm.path, dec="," )
##D # summary
##D summary(mod, logfile="ex1__1dim_1pl__SUMMARY")
##D # jackknife
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=20 )
##D summary(jmod, logfile="ex1__1dim_1pl__JACKKNIFE")
##D # compute factor scores (EAPs)
##D emod <- sirt::R2noharm.EAP(mod)
##D 
##D #*****-----
##D # Model 1b: Include student weights in estimation
##D N <- nrow(dat)
##D weights <- stats::runif( N, 1, 5 )
##D mod1b <- sirt::R2noharm( dat=dat, model.type="CFA",  weights=weights,
##D             F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D             P.init=P.init, writename="ex1__1dim_1pl_w",
##D             noharm.path=noharm.path, dec="," )
##D summary(mod1b)
##D 
##D #****************************************
##D # Model 2: 1-dimensional 2PL Model
##D 
##D # set trait variance equal to 1
##D P.pattern <- matrix( 0, ncol=1, nrow=1 )
##D P.init <- 1+0*P.pattern
##D # loading matrix
##D F.pattern <- matrix( 1, nrow=I, ncol=1 )
##D F.init <- 1 + 0*F.pattern
##D 
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",
##D             F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D             P.init=P.init, writename="ex2__1dim_2pl",
##D             noharm.path=noharm.path, dec="," )
##D 
##D summary(mod)
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=20 )
##D summary(jmod)
##D 
##D #****************************************
##D # Model 3: 1-dimensional 3PL Model with fixed guessing parameters
##D 
##D # set trait variance equal to 1
##D P.pattern <- matrix( 0, ncol=1, nrow=1 )
##D P.init <- 1+0*P.pattern
##D # loading matrix
##D F.pattern <- matrix( 1, nrow=I, ncol=1 )
##D F.init <- 1 + 0*F.pattern       #
##D # fix guessing parameters equal to .2 (for all items)
##D guesses <- rep( .1, I )
##D 
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",
##D           F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D           P.init=P.init, guesses=guesses,
##D           writename="ex3__1dim_3pl", noharm.path=noharm.path, dec=","  )
##D summary(mod)
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=20 )
##D summary(jmod)
##D 
##D #****************************************
##D # Model 4: 3-dimensional Rasch model
##D 
##D # estimate one factor variance
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D P.init <- .8*P.pattern
##D diag(P.init) <- 1
##D # fix all entries in the loading matrix to 1
##D F.init <- F.pattern <- matrix( 0, nrow=I, ncol=3 )
##D F.init[1:6,1] <- 1
##D F.init[7:12,2] <- 1
##D F.init[13:18,3] <- 1
##D 
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",
##D           F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D           P.init=P.init, writename="ex4__3dim_1pl",
##D           noharm.path=noharm.path, dec="," )
##D # write output from R console in a file
##D summary(mod, logfile="ex4__3dim_1pl__SUMMARY.Rout")
##D 
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=20 )
##D summary(jmod)
##D 
##D # extract factor scores
##D emod <- sirt::R2noharm.EAP(mod)
##D 
##D #****************************************
##D # Model 5: 3-dimensional 2PL model
##D 
##D # estimate one factor variance
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D P.init <- .8*P.pattern
##D diag(P.init) <- 0
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 0, nrow=I, ncol=3 )
##D F.pattern[1:6,1] <- 1
##D F.pattern[7:12,2] <- 1
##D F.pattern[13:18,3] <- 1
##D F.init <- F.pattern
##D 
##D mod <- sirt::R2noharm( dat=dat, model.type="CFA",
##D           F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D           P.init=P.init, writename="ex5__3dim_2pl",
##D           noharm.path=noharm.path, dec="," )
##D summary(mod)
##D # use 50 jackknife units with 4 persons within a unit
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=seq( 1:50, each=4 ) )
##D summary(jmod)
##D 
##D #****************************************
##D # Model 6: Exploratory Factor Analysis with 3 factors
##D 
##D mod <- sirt::R2noharm( dat=dat, model.type="EFA",  dimensions=3,
##D            writename="ex6__3dim_efa", noharm.path=noharm.path,dec=",")
##D summary(mod)
##D 
##D jmod <- sirt::R2noharm.jackknife( mod, jackunits=20 )
##D 
##D #############################################################################
##D # EXAMPLE 2: NOHARM manual Example A
##D #############################################################################
##D 
##D # See NOHARM manual: http://noharm.niagararesearch.ca/nh4man/nhman.html
##D # The following text and data is copied from this manual.
##D #
##D # In the first example, we demonstrate how to prepare the input for a 2-dimensional
##D # model using exploratory analysis. Data from a 9 item test were collected from
##D # 200 students and the 9x9 product-moment matrix of the responses was computed.
##D #
##D # Our hypothesis is for a 2-dimensional model with no guessing,
##D # i.e., all guesses are equal to zero. However, because we are unsure of any
##D # particular pattern for matrix F, we wish to prescribe an exploratory analysis, i.e.,
##D # set EX=1. Also, we will content ourselves with letting the program supply all
##D # initial values.
##D #
##D # We would like both the sample product-moment matrix and the residual matrix to
##D # be included in the output.
##D 
##D # scan product-moment matrix copied from the NOHARM manual
##D pm <- scan()
##D      0.8967
##D      0.2278 0.2356
##D      0.6857 0.2061 0.7459
##D      0.8146 0.2310 0.6873 0.8905
##D      0.4505 0.1147 0.3729 0.4443 0.5000
##D      0.7860 0.2080 0.6542 0.7791 0.4624 0.8723
##D      0.2614 0.0612 0.2140 0.2554 0.1914 0.2800 0.2907
##D      0.7549 0.1878 0.6236 0.7465 0.4505 0.7590 0.2756 0.8442
##D      0.6191 0.1588 0.5131 0.6116 0.3845 0.6302 0.2454 0.6129 0.6879
##D 
##D ex2 <- sirt::R2noharm( pm=pm, n=200, model.type="EFA", dimensions=2,
##D          noharm.path=noharm.path, writename="ex2_noharmExA", dec=",")
##D summary(ex2)
##D 
##D #############################################################################
##D # EXAMPLE 3: NOHARM manual Example B
##D #############################################################################
##D 
##D # See NOHARM manual: http://noharm.niagararesearch.ca/nh4man/nhman.html
##D # The following text and data is copied from this manual.
##D 
##D # Suppose we have the product-moment matrix of data from 125 students on 9 items.
##D # Our hypothesis is for 2 dimensions with simple structure. In this case,
##D # items 1 to 5 have coefficients of theta which are to be estimated for one
##D # latent trait but are to be fixed at zero for the other one.
##D # For the latent trait for which items 1 to 5 have zero coefficients,
##D # items 6 to 9 have coefficients which are to be estimated. For the other
##D # latent trait, items 6 to 9 will have zero coefficients.
##D # We also wish to estimate the correlation between the latent traits,
##D # so we prescribe P as a 2x2 correlation matrix.
##D #
##D # Our hypothesis prescribes that there was no guessing involved, i.e.,
##D # all guesses are equal to zero. For demonstration purposes,
##D # let us not have the program print out the sample product-moment matrix.
##D # Also let us not supply any starting values but, rather, use the defaults
##D # supplied by the program.
##D 
##D pm <- scan()
##D     0.930
##D     0.762 0.797
##D     0.541 0.496 0.560
##D     0.352 0.321 0.261 0.366
##D     0.205 0.181 0.149 0.110 0.214
##D     0.858 0.747 0.521 0.336 0.203 0.918
##D     0.773 0.667 0.465 0.308 0.184 0.775 0.820
##D     0.547 0.474 0.347 0.233 0.132 0.563 0.524 0.579
##D     0.329 0.290 0.190 0.140 0.087 0.333 0.308 0.252 0.348
##D 
##D I <- 9    # number of items
##D # define loading matrix
##D F.pattern <- matrix(0,I,2)
##D F.pattern[1:5,1] <- 1
##D F.pattern[6:9,2] <- 1
##D F.init <- F.pattern
##D # define covariance matrix
##D P.pattern <- matrix(1,2,2)
##D diag(P.pattern) <- 0
##D P.init <- 1+P.pattern
##D 
##D ex3 <- sirt::R2noharm( pm=pm, n=125,, model.type="CFA",
##D            F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D            P.init=P.init, writename="ex3_noharmExB",
##D            noharm.path=noharm.path, dec="," )
##D summary(ex3)
##D 
##D #############################################################################
##D # EXAMPLE 4: NOHARM manual Example C
##D #############################################################################
##D 
##D data(data.noharmExC)
##D # See NOHARM manual: http://noharm.niagararesearch.ca/nh4man/nhman.html
##D # The following text and data is copied from this manual.
##D 
##D # In this example, suppose that from 300 respondents we have item
##D # responses scored dichotomously, 1 or 0, for 8 items.
##D #
##D # Our hypothesis is for a unidimensional model where all eight items
##D # have coefficients of theta which are to be estimated.
##D # Suppose that since the items were multiple choice with 5 options each,
##D # we set the fixed guesses all to 0.2 (not necessarily good reasoning!)
##D #
##D # Let's supply initial values for the coefficients of theta (F matrix)
##D # as .75 for items 1 to 4 and .6 for items 5 to 8.
##D 
##D I <- 8
##D guesses <- rep(.2,I)
##D F.pattern <- matrix(1,I,1)
##D F.init <- F.pattern
##D F.init[1:4,1] <- .75
##D F.init[5:8,1] <- .6
##D P.pattern <- matrix(0,1,1)
##D P.init <- 1 + 0 * P.pattern
##D 
##D ex4 <- sirt::R2noharm( dat=data.noharmExC,, model.type="CFA",
##D            guesses=guesses, F.pattern=F.pattern, F.init=F.init,
##D            P.pattern=P.pattern, P.init=P.init, writename="ex3_noharmExC",
##D            noharm.path=noharm.path, dec="," )
##D summary(ex4)
##D 
##D # modify F pattern matrix
##D # f11=f51 (since both have equal pattern values of 2),
##D # f21=f61 (since both have equal pattern values of 3),
##D # f31=f71 (since both have equal pattern values of 4),
##D # f41=f81 (since both have equal pattern values of 5).
##D F.pattern[ c(1,5) ] <- 2
##D F.pattern[ c(2,6) ] <- 3
##D F.pattern[ c(3,7) ] <- 4
##D F.pattern[ c(4,8) ] <- 5
##D F.init <- .5+0*F.init
##D 
##D ex4a <- sirt::R2noharm( dat=data.noharmExC,, model.type="CFA",
##D            guesses=guesses, F.pattern=F.pattern, F.init=F.init,
##D            P.pattern=P.pattern, P.init=P.init, writename="ex3_noharmExC1",
##D            noharm.path=noharm.path, dec="," )
##D summary(ex4a)
## End(Not run)



