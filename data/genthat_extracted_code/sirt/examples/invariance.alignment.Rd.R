library(sirt)


### Name: invariance.alignment
### Title: Alignment Procedure for Linking under Approximate Invariance
### Aliases: invariance.alignment summary.invariance.alignment
###   plot.invariance.alignment
### Keywords: Linking Approximate Invariance Alignment summary

### ** Examples

#############################################################################
# EXAMPLE 1: Item parameters cultural activities
#############################################################################

data( data.activity.itempars )
lambda <- data.activity.itempars$lambda
nu <- data.activity.itempars$nu
Ng <-  data.activity.itempars$N
wgt <- matrix( sqrt(Ng), length(Ng), ncol(nu) )

#***
# Model 1: Alignment using a quadratic loss function
#   -> use the default of align.pow=c(1,1) and align.scale=c(1,1)
mod1 <- sirt::invariance.alignment( lambda, nu, wgt )
summary(mod1)
  ##   Effect Sizes of Approximate Invariance
  ##          loadings intercepts
  ##   R2       0.9944     0.9988
  ##   sqrtU2   0.0748     0.0346
  ##   rbar     0.9265     0.9735

#****
# Model 2: Different powers for alignment
mod2 <- sirt::invariance.alignment( lambda, nu, wgt,  align.pow=c(.25,1/2),
              align.scale=c(.95,.95),  max.increment=.1)
summary(mod2)

# compare means from Models 1 and 2
plot( mod1$pars$alpha0, mod2$pars$alpha0, pch=16,
    xlab="M (Model 1)", ylab="M (Model 2)", xlim=c(-.3,.3), ylim=c(-.3,.3) )
lines( c(-1,1), c(-1,1), col="gray")
round( cbind( mod1$pars$alpha0, mod2$pars$alpha0 ), 3 )
round( mod1$nu.resid, 3)
round( mod2$nu.resid,3 )

#****
# Model 3: Low powers for alignment of scale and power
# Note that setting increment.factor larger than 1 seems necessary
mod3 <- sirt::invariance.alignment( lambda, nu, wgt, align.pow=c(.25,.35),
            align.scale=c(.55,.55), psi0.init=mod1$psi0, alpha0.init=mod1$alpha0 )
summary(mod3)

# compare mean and SD estimates of Models 1 and 3
plot( mod1$pars$alpha0, mod3$pars$alpha0, pch=16)
plot( mod1$pars$psi0, mod3$pars$psi0, pch=16)

# compare residuals for Models 1 and 3
# plot lambda
plot( abs(as.vector(mod1$lambda.resid)), abs(as.vector(mod3$lambda.resid)),
      pch=16, xlab="Residuals lambda (Model 1)",
      ylab="Residuals lambda (Model 3)", xlim=c(0,.1), ylim=c(0,.1))
lines( c(-3,3),c(-3,3), col="gray")
# plot nu
plot( abs(as.vector(mod1$nu.resid)), abs(as.vector(mod3$nu.resid)),
      pch=16, xlab="Residuals nu (Model 1)", ylab="Residuals nu (Model 3)",
      xlim=c(0,.4),ylim=c(0,.4))
lines( c(-3,3),c(-3,3), col="gray")

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Comparison 4 groups | data.inv4gr
##D #############################################################################
##D 
##D data(data.inv4gr)
##D dat <- data.inv4gr
##D miceadds::library_install("semTools")
##D 
##D model1 <- "
##D     F=~ I01 + I02 + I03 + I04 + I05 + I06 + I07 + I08 + I09 + I10 + I11
##D     F ~~ 1*F
##D     "
##D 
##D res <- semTools::measurementInvariance(model1, std.lv=TRUE, data=dat, group="group")
##D   ##   Measurement invariance tests:
##D   ##
##D   ##   Model 1: configural invariance:
##D   ##       chisq        df    pvalue       cfi     rmsea       bic
##D   ##     162.084   176.000     0.766     1.000     0.000 95428.025
##D   ##
##D   ##   Model 2: weak invariance (equal loadings):
##D   ##       chisq        df    pvalue       cfi     rmsea       bic
##D   ##     519.598   209.000     0.000     0.973     0.039 95511.835
##D   ##
##D   ##   [Model 1 versus model 2]
##D   ##     delta.chisq      delta.df delta.p.value     delta.cfi
##D   ##         357.514        33.000         0.000         0.027
##D   ##
##D   ##   Model 3: strong invariance (equal loadings + intercepts):
##D   ##       chisq        df    pvalue       cfi     rmsea       bic
##D   ##    2197.260   239.000     0.000     0.828     0.091 96940.676
##D   ##
##D   ##   [Model 1 versus model 3]
##D   ##     delta.chisq      delta.df delta.p.value     delta.cfi
##D   ##        2035.176        63.000         0.000         0.172
##D   ##
##D   ##   [Model 2 versus model 3]
##D   ##     delta.chisq      delta.df delta.p.value     delta.cfi
##D   ##        1677.662        30.000         0.000         0.144
##D   ##
##D 
##D # extract item parameters separate group analyses
##D ipars <- lavaan::parameterEstimates(res$fit.configural)
##D # extract lambda's: groups are in rows, items in columns
##D lambda <- matrix( ipars[ ipars$op=="=~", "est"], nrow=4,  byrow=TRUE)
##D colnames(lambda) <- colnames(dat)[-1]
##D # extract nu's
##D nu <- matrix( ipars[ ipars$op=="~1"  & ipars$se !=0, "est" ], nrow=4,  byrow=TRUE)
##D colnames(nu) <- colnames(dat)[-1]
##D 
##D # Model 1: least squares optimization
##D mod1 <- sirt::invariance.alignment( lambda=lambda, nu=nu )
##D summary(mod1)
##D   ##   Effect Sizes of Approximate Invariance
##D   ##          loadings intercepts
##D   ##   R2       0.9826     0.9972
##D   ##   sqrtU2   0.1319     0.0526
##D   ##   rbar     0.6237     0.7821
##D   ##   -----------------------------------------------------------------
##D   ##   Group Means and Standard Deviations
##D   ##     alpha0  psi0
##D   ##   1  0.000 0.965
##D   ##   2 -0.105 1.098
##D   ##   3 -0.081 1.011
##D   ##   4  0.171 0.935
##D 
##D # Model 2: sparse target function
##D mod2 <- sirt::invariance.alignment( lambda=lambda, nu=nu, align.pow=c(1/4,1/4) )
##D summary(mod2)
##D   ##   Effect Sizes of Approximate Invariance
##D   ##          loadings intercepts
##D   ##   R2       0.9824     0.9972
##D   ##   sqrtU2   0.1327     0.0529
##D   ##   rbar     0.6237     0.7856
##D   ##   -----------------------------------------------------------------
##D   ##   Group Means and Standard Deviations
##D   ##     alpha0  psi0
##D   ##   1 -0.002 0.965
##D   ##   2 -0.107 1.098
##D   ##   3 -0.083 1.011
##D   ##   4  0.170 0.935
##D 
##D #############################################################################
##D # EXAMPLE 3: European Social Survey data.ess2005
##D #############################################################################
##D 
##D data(data.ess2005)
##D lambda <- data.ess2005$lambda
##D nu <- data.ess2005$nu
##D 
##D # Model 1: least squares optimization
##D mod1 <- sirt::invariance.alignment( lambda=lambda, nu=nu )
##D summary(mod1)
##D 
##D # Model 2: sparse target function and definition of scales
##D mod2 <- sirt::invariance.alignment( lambda=lambda, nu=nu, align.pow=c(1/4,1/4),
##D             align.scale=c( .2, .3)  )
##D summary(mod2)
##D 
##D # compare results of Model 1 and Model 2
##D round( cbind( mod1$pars, mod2$pars ), 2 )
##D   ##      alpha0 psi0 alpha0 psi0
##D   ##   1    0.06 0.87   0.05 0.91
##D   ##   2   -0.51 1.03  -0.37 0.99
##D   ##   3    0.18 0.97   0.25 1.04
##D   ##   4   -0.67 0.90  -0.53 0.90
##D   ##   5    0.09 0.98   0.10 0.99
##D   ##   6    0.23 1.03   0.28 1.00
##D   ##   7    0.27 0.97   0.14 1.10
##D   ##   8    0.18 0.90   0.07 0.89
##D   ##   [...]
##D 
##D # look at nu residuals to explain differences in means
##D round( mod1$nu.resid, 2)
##D   ##         ipfrule ipmodst ipbhprp imptrad
##D   ##    [1,]    0.15   -0.25   -0.01    0.01
##D   ##    [2,]   -0.18    0.23    0.10   -0.24
##D   ##    [3,]    0.22   -0.34    0.05   -0.02
##D   ##    [4,]    0.29   -0.04    0.12   -0.53
##D   ##    [5,]   -0.32    0.19    0.00    0.13
##D   ##    [6,]    0.05   -0.21    0.05    0.04
##D   ##    [7,]   -0.26    0.54   -0.15   -0.02
##D   ##    [8,]    0.07   -0.05   -0.10    0.12
##D round( mod2$nu.resid, 2)
##D   ##         ipfrule ipmodst ipbhprp imptrad
##D   ##    [1,]    0.16   -0.25    0.00    0.02
##D   ##    [2,]   -0.27    0.14    0.00   -0.30
##D   ##    [3,]    0.18   -0.37    0.00   -0.05
##D   ##    [4,]    0.19   -0.13    0.00   -0.60
##D   ##    [5,]   -0.33    0.19   -0.01    0.12
##D   ##    [6,]    0.00   -0.23    0.00    0.01
##D   ##    [7,]   -0.16    0.64   -0.01    0.04
##D   ##    [8,]    0.15    0.02   -0.02    0.19
##D 
##D round( rowMeans( mod1$nu.resid )[1:8], 2 )
##D   ##   [1] -0.02 -0.02 -0.02 -0.04  0.00 -0.02  0.03  0.01
##D round( rowMeans( mod2$nu.resid )[1:8], 2 )
##D   ##   [1] -0.02 -0.11 -0.06 -0.14 -0.01 -0.06  0.13  0.09
##D 
##D #############################################################################
##D # EXAMPLE 4: Linking with item parameters containing outliers
##D #############################################################################
##D 
##D # see Help file in linking.robust
##D 
##D # simulate some item difficulties in the Rasch model
##D I <- 38
##D set.seed(18785)
##D itempars <- data.frame("item"=paste0("I",1:I) )
##D itempars$study1 <- stats::rnorm( I, mean=.3, sd=1.4 )
##D # simulate DIF effects plus some outliers
##D bdif <- stats::rnorm(I,mean=.4,sd=.09)+( stats::runif(I)>.9 )* rep( 1*c(-1,1)+.4, each=I/2 )
##D itempars$study2 <- itempars$study1 + bdif
##D # create input for function invariance.alignment
##D nu <- t( itempars[,2:3] )
##D colnames(nu) <- itempars$item
##D lambda <- 1+0*nu
##D 
##D # linking using least squares optimization
##D mod1 <- sirt::invariance.alignment( lambda=lambda, nu=nu )
##D summary(mod1)
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0 psi0
##D   ##   study1 -0.286    1
##D   ##   study2  0.286    1
##D 
##D # linking using powers of .5
##D mod2 <- sirt::invariance.alignment( lambda=lambda, nu=nu, align.pow=c(.5,.5) )
##D summary(mod2)
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0 psi0
##D   ##   study1 -0.213    1
##D   ##   study2  0.213    1
##D 
##D # linking using powers of .25
##D mod3 <- sirt::invariance.alignment( lambda=lambda, nu=nu, align.pow=c(.25,.25) )
##D summary(mod3)
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0 psi0
##D   ##   study1 -0.207    1
##D   ##   study2  0.207    1
##D 
##D #############################################################################
##D # EXAMPLE 5: Linking gender groups with data.math
##D #############################################################################
##D 
##D data(data.math)
##D dat <- data.math$data
##D dat.male <- dat[ dat$female==0, substring( colnames(dat),1,1)=="M"  ]
##D dat.female <- dat[ dat$female==1, substring( colnames(dat),1,1)=="M"  ]
##D 
##D #*************************
##D # Model 1: Linking using the Rasch model
##D mod1m <- sirt::rasch.mml2( dat.male )
##D mod1f <- sirt::rasch.mml2( dat.female )
##D 
##D # create objects for invariance.alignment
##D nu <- rbind( mod1m$item$thresh, mod1f$item$thresh )
##D colnames(nu) <- mod1m$item$item
##D rownames(nu) <- c("male", "female")
##D lambda <- 1+0*nu
##D 
##D # mean of item difficulties
##D round( rowMeans(nu), 3 )
##D   ##     male female
##D   ##   -0.081 -0.049
##D 
##D # Linking using least squares optimization
##D res1a <- sirt::invariance.alignment( lambda, nu, align.scale=c( .3, .5 ) )
##D summary(res1a)
##D   ##   Effect Sizes of Approximate Invariance
##D   ##          loadings intercepts
##D   ##   R2            1     0.9801
##D   ##   sqrtU2        0     0.1412
##D   ##   rbar          1     0.9626
##D   ##   -----------------------------------------------------------------
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0 psi0
##D   ##   male   -0.016    1
##D   ##   female  0.016    1
##D 
##D # Linking using optimization with absolute values
##D res1b <- sirt::invariance.alignment( lambda, nu, align.scale=c( .3, .5 ),
##D                 align.pow=c( .5, .5 ) )
##D summary(res1b)
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0 psi0
##D   ##   male   -0.045    1
##D   ##   female  0.045    1
##D 
##D #-- compare results with Haberman linking
##D I <- ncol(dat.male)
##D itempartable <- data.frame( "study"=rep( c("male", "female"), each=I ) )
##D itempartable$item <- c( paste0(mod1m$item$item),  paste0(mod1f$item$item) )
##D itempartable$a <- 1
##D itempartable$b <- c( mod1m$item$b, mod1f$item$b )
##D # estimate linking parameters
##D res1c <- sirt::linking.haberman( itempars=itempartable )
##D   ##   Transformation parameters (Haberman linking)
##D   ##      study At     Bt
##D   ##   1 female  1  0.000
##D   ##   2   male  1 -0.032
##D   ##   Linear transformation for person parameters theta
##D   ##      study A_theta B_theta
##D   ##   1 female       1   0.000
##D   ##   2   male       1   0.032
##D   ##   R-Squared Measures of Invariance
##D   ##          slopes intercepts
##D   ##   R2          1     0.9801
##D   ##   sqrtU2      0     0.1412
##D 
##D #-- results of equating.rasch
##D x <- itempartable[ 1:I, c("item", "b") ]
##D y <- itempartable[ I + 1:I, c("item", "b") ]
##D res1d <- sirt::equating.rasch( x, y )
##D round( res1d$B.est, 3 )
##D   ##     Mean.Mean Haebara Stocking.Lord
##D   ##   1     0.032   0.032         0.029
##D 
##D #*************************
##D # Model 2: Linking using the 2PL model
##D I <- ncol(dat.male)
##D mod2m <- sirt::rasch.mml2( dat.male, est.a=1:I)
##D mod2f <- sirt::rasch.mml2( dat.female, est.a=1:I)
##D 
##D # create objects for invariance.alignment
##D nu <- rbind( mod2m$item$thresh, mod2f$item$thresh )
##D colnames(nu) <- mod2m$item$item
##D rownames(nu) <- c("male", "female")
##D lambda <- rbind( mod2m$item$a, mod2f$item$a )
##D colnames(lambda) <- mod2m$item$item
##D rownames(lambda) <- c("male", "female")
##D 
##D res2a <- sirt::invariance.alignment( lambda, nu, align.scale=c( .3, .5 ) )
##D summary(res2a)
##D   ##   Effect Sizes of Approximate Invariance
##D   ##          loadings intercepts
##D   ##   R2       0.9589     0.9682
##D   ##   sqrtU2   0.2027     0.1782
##D   ##   rbar     0.5177     0.9394
##D   ##   -----------------------------------------------------------------
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0  psi0
##D   ##   male   -0.044 0.968
##D   ##   female  0.047 1.034
##D 
##D res2b <- sirt::invariance.alignment( lambda, nu, align.scale=c( .3, .5 ),
##D                 align.pow=c( .5, .5 ) )
##D summary(res2b)
##D   ##   Group Means and Standard Deviations
##D   ##          alpha0  psi0
##D   ##   male   -0.046 1.053
##D   ##   female  0.041 0.951
##D 
##D # compare results with Haberman linking
##D I <- ncol(dat.male)
##D itempartable <- data.frame( "study"=rep( c("male", "female"), each=I ) )
##D itempartable$item <- c( paste0(mod2m$item$item),  paste0(mod2f$item$item ) )
##D itempartable$a <- c( mod2m$item$a, mod2f$item$a )
##D itempartable$b <- c( mod2m$item$b, mod2f$item$b )
##D # estimate linking parameters
##D res2c <- sirt::linking.haberman( itempars=itempartable )
##D   ##   Transformation parameters (Haberman linking)
##D   ##      study    At   Bt
##D   ##   1 female 1.000 0.00
##D   ##   2   male 1.041 0.09
##D   ##   Linear transformation for person parameters theta
##D   ##      study A_theta B_theta
##D   ##   1 female   1.000    0.00
##D   ##   2   male   1.041   -0.09
##D   ##   R-Squared Measures of Invariance
##D   ##          slopes intercepts
##D   ##   R2     0.9554     0.9484
##D   ##   sqrtU2 0.2111     0.2273
## End(Not run)



