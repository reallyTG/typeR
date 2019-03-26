library(sirt)


### Name: latent.regression.em.raschtype
### Title: Latent Regression Model for the Generalized Logistic Item
###   Response Model and the Linear Model for Normal Responses
### Aliases: latent.regression.em.raschtype latent.regression.em.normal
###   summary.latent.regression
### Keywords: Latent regression model Generalized logistic item response
###   model Plausible values summary

### ** Examples

#############################################################################
#  EXAMPLE 1: PISA Reading | Rasch model for dichotomous data
#############################################################################

data( data.pisaRead)
dat <- data.pisaRead$data
items <- grep("R", colnames(dat))
# define matrix of covariates
X <- cbind( 1, dat[, c("female","hisei","migra" ) ] )

#***
# Model 1: Latent regression model in the Rasch model
# estimate Rasch model
mod1 <- sirt::rasch.mml2( dat[,items] )
# latent regression model
lm1 <- sirt::latent.regression.em.raschtype( data=dat[,items ], X=X, b=mod1$item$b )

## Not run: 
##D #***
##D # Model 2: Latent regression with generalized link function
##D # estimate alpha parameters for link function
##D mod2 <- sirt::rasch.mml2( dat[,items], est.alpha=TRUE)
##D # use model estimated likelihood for latent regression model
##D lm2 <- sirt::latent.regression.em.raschtype( f.yi.qk=mod2$f.yi.qk,
##D             X=X, theta.list=mod2$theta.k)
##D 
##D #***
##D # Model 3: Latent regression model based on Rasch copula model
##D testlets <- paste( data.pisaRead$item$testlet)
##D itemclusters <- match( testlets, unique(testlets) )
##D # estimate Rasch copula model
##D mod3 <- sirt::rasch.copula2( dat[,items], itemcluster=itemclusters )
##D # use model estimated likelihood for latent regression model
##D lm3 <- sirt::latent.regression.em.raschtype( f.yi.qk=mod3$f.yi.qk,
##D                 X=X, theta.list=mod3$theta.k)
##D 
##D #############################################################################
##D # EXAMPLE 2: Simulated data according to the Rasch model
##D #############################################################################
##D 
##D set.seed(899)
##D I <- 21     # number of items
##D b <- seq(-2,2, len=I)   # item difficulties
##D n <- 2000       # number of students
##D 
##D # simulate theta and covariates
##D theta <- stats::rnorm( n )
##D x <- .7 * theta + stats::rnorm( n, .5 )
##D y <- .2 * x+ .3*theta + stats::rnorm( n, .4 )
##D dfr <- data.frame( theta, 1, x, y )
##D 
##D # simulate Rasch model
##D dat1 <- sirt::sim.raschtype( theta=theta, b=b )
##D 
##D # estimate latent regression
##D mod <- sirt::latent.regression.em.raschtype( data=dat1, X=dfr[,-1], b=b )
##D   ## Regression Parameters
##D   ##
##D   ##        est se.simple     se        t p   beta    fmi N.simple pseudoN.latent
##D   ## X1 -0.2554    0.0208 0.0248 -10.2853 0 0.0000 0.2972     2000       1411.322
##D   ## x   0.4113    0.0161 0.0193  21.3037 0 0.4956 0.3052     2000       1411.322
##D   ## y   0.1715    0.0179 0.0213   8.0438 0 0.1860 0.2972     2000       1411.322
##D   ##
##D   ## Residual Variance=0.685
##D   ## Explained Variance=0.3639
##D   ## Total Variance  =1.049
##D   ##                 R2=0.3469
##D 
##D # compare with linear model (based on true scores)
##D summary( stats::lm( theta  ~ x + y, data=dfr ) )
##D   ## Coefficients:
##D   ##             Estimate Std. Error t value Pr(>|t|)
##D   ## (Intercept) -0.27821    0.01984  -14.02   <2e-16 ***
##D   ## x            0.40747    0.01534   26.56   <2e-16 ***
##D   ## y            0.18189    0.01704   10.67   <2e-16 ***
##D   ## ---
##D   ##
##D   ## Residual standard error: 0.789 on 1997 degrees of freedom
##D   ## Multiple R-squared: 0.3713,     Adjusted R-squared: 0.3707
##D 
##D #***********
##D # define guessing parameters (lower asymptotes) and
##D # upper asymptotes ( 1 minus slipping parameters)
##D cI <- rep(.2, I)        # all items get a guessing parameter of .2
##D cI[ c(7,9) ] <- .25     # 7th and 9th get a guessing parameter of .25
##D dI <- rep( .95, I )    # upper asymptote of .95
##D dI[ c(7,11) ] <- 1        # 7th and 9th item have an asymptote of 1
##D 
##D # latent regression model
##D mod1 <- sirt::latent.regression.em.raschtype( data=dat1, X=dfr[,-1],
##D            b=b, c=cI, d=dI    )
##D   ## Regression Parameters
##D   ##
##D   ##        est se.simple     se        t p   beta    fmi N.simple pseudoN.latent
##D   ## X1 -0.7929    0.0243 0.0315 -25.1818 0 0.0000 0.4044     2000       1247.306
##D   ## x   0.5025    0.0188 0.0241  20.8273 0 0.5093 0.3936     2000       1247.306
##D   ## y   0.2149    0.0209 0.0266   8.0850 0 0.1960 0.3831     2000       1247.306
##D   ##
##D   ## Residual Variance=0.9338
##D   ## Explained Variance=0.5487
##D   ## Total Variance  =1.4825
##D   ##                 R2=0.3701
##D 
##D #############################################################################
##D # EXAMPLE 3: Measurement error in dependent variable
##D #############################################################################
##D 
##D set.seed(8766)
##D N <- 4000       # number of persons
##D X <- stats::rnorm(N)           # independent variable
##D Z <- stats::rnorm(N)           # independent variable
##D y <- .45 * X + .25 * Z + stats::rnorm(N)   # dependent variable true score
##D sig.e <- stats::runif( N, .5, .6 )       # measurement error standard deviation
##D yast <- y + stats::rnorm( N, sd=sig.e ) # dependent variable measured with error
##D 
##D #****
##D # Model 1: Estimation with latent.regression.em.raschtype using
##D #          individual likelihood
##D # define theta grid for evaluation of density
##D theta.list <- mean(yast) + stats::sd(yast) * seq( - 5, 5, length=21)
##D # compute individual likelihood
##D f.yi.qk <- stats::dnorm( outer( yast, theta.list, "-" ) / sig.e )
##D f.yi.qk <- f.yi.qk / rowSums(f.yi.qk)
##D # define predictor matrix
##D X1 <- as.matrix(data.frame( "intercept"=1, "X"=X, "Z"=Z ))
##D 
##D # latent regression model
##D res <- sirt::latent.regression.em.raschtype( f.yi.qk=f.yi.qk,
##D                     X=X1, theta.list=theta.list)
##D   ##   Regression Parameters
##D   ##
##D   ##                est se.simple     se       t      p   beta    fmi N.simple pseudoN.latent
##D   ##   intercept 0.0112    0.0157 0.0180  0.6225 0.5336 0.0000 0.2345     4000       3061.998
##D   ##   X         0.4275    0.0157 0.0180 23.7926 0.0000 0.3868 0.2350     4000       3061.998
##D   ##   Z         0.2314    0.0156 0.0178 12.9868 0.0000 0.2111 0.2349     4000       3061.998
##D   ##
##D   ##   Residual Variance=0.9877
##D   ##   Explained Variance=0.2343
##D   ##   Total Variance  =1.222
##D   ##                   R2=0.1917
##D 
##D #****
##D # Model 2: Estimation with latent.regression.em.normal
##D res2 <- sirt::latent.regression.em.normal( y=yast, sig.e=sig.e, X=X1)
##D   ##   Regression Parameters
##D   ##
##D   ##                est se.simple     se       t      p   beta    fmi N.simple pseudoN.latent
##D   ##   intercept 0.0112    0.0157 0.0180  0.6225 0.5336 0.0000 0.2345     4000       3062.041
##D   ##   X         0.4275    0.0157 0.0180 23.7927 0.0000 0.3868 0.2350     4000       3062.041
##D   ##   Z         0.2314    0.0156 0.0178 12.9870 0.0000 0.2111 0.2349     4000       3062.041
##D   ##
##D   ##   Residual Variance=0.9877
##D   ##   Explained Variance=0.2343
##D   ##   Total Variance  =1.222
##D   ##                   R2=0.1917
##D 
##D   ## -> Results between Model 1 and Model 2 are identical because they use
##D   ##    the same input.
##D 
##D #***
##D # Model 3: Regression model based on true scores y
##D mod3 <- stats::lm( y ~ X + Z )
##D summary(mod3)
##D   ##   Coefficients:
##D   ##               Estimate Std. Error t value Pr(>|t|)
##D   ##   (Intercept)  0.02364    0.01569   1.506    0.132
##D   ##   X            0.42401    0.01570  27.016   <2e-16 ***
##D   ##   Z            0.23804    0.01556  15.294   <2e-16 ***
##D   ##   Residual standard error: 0.9925 on 3997 degrees of freedom
##D   ##   Multiple R-squared:  0.1923,    Adjusted R-squared:  0.1919
##D   ##   F-statistic: 475.9 on 2 and 3997 DF,  p-value: < 2.2e-16
##D 
##D #***
##D # Model 4: Regression model based on observed scores yast
##D mod4 <- stats::lm( yast ~ X + Z )
##D summary(mod4)
##D   ##   Coefficients:
##D   ##               Estimate Std. Error t value Pr(>|t|)
##D   ##   (Intercept)  0.01101    0.01797   0.613     0.54
##D   ##   X            0.42716    0.01797  23.764   <2e-16 ***
##D   ##   Z            0.23174    0.01783  13.001   <2e-16 ***
##D   ##   Residual standard error: 1.137 on 3997 degrees of freedom
##D   ##   Multiple R-squared:  0.1535,    Adjusted R-squared:  0.1531
##D   ##   F-statistic: 362.4 on 2 and 3997 DF,  p-value: < 2.2e-16
## End(Not run)



