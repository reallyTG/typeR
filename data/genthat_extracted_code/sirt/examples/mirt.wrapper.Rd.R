library(sirt)


### Name: mirt.wrapper
### Title: Some Functions for Wrapping with the 'mirt' Package
### Aliases: mirt.wrapper mirt.wrapper.coef mirt.wrapper.posterior
###   mirt.wrapper.fscores mirt.wrapper.itemplot
###   IRT.irfprob.SingleGroupClass IRT.likelihood.SingleGroupClass
###   IRT.posterior.SingleGroupClass
### Keywords: mirt

### ** Examples

## Not run: 
##D # A development version can be installed from GitHub
##D if (FALSE){ # default is set to FALSE, use the installed version
##D    library(devtools)
##D    devtools::install_github("philchalmers/mirt")
##D           }
##D # now, load mirt
##D library(mirt)
##D 
##D #############################################################################
##D # EXAMPLE 1: Extracting item parameters and posterior LSAT data
##D #############################################################################
##D 
##D data(LSAT7, package="mirt")
##D data <- mirt::expand.table(LSAT7)
##D 
##D #*** Model 1: 3PL model for item 5 only, other items 2PL
##D mod1 <- mirt::mirt(data, 1, itemtype=c("2PL","2PL","2PL","2PL","3PL"), verbose=TRUE)
##D print(mod1)
##D summary(mod1)
##D # extracting coefficients
##D coef(mod1)
##D mirt.wrapper.coef(mod1)$coef
##D # extract parameter values in mirt
##D mirt::mod2values(mod1)
##D # extract posterior
##D post1 <- sirt::mirt.wrapper.posterior(mod1)
##D # extract item response functions
##D probs1 <- IRT.irfprob( mod1 )
##D str(probs1)
##D # extract individual likelihood
##D likemod1 <- IRT.likelihood( mod1 )
##D str(likemod1)
##D # extract individual posterior
##D postmod1 <- IRT.posterior( mod1 )
##D str(postmod1)
##D 
##D #*** Model 2: Confirmatory model with two factors
##D cmodel <- mirt::mirt.model("
##D         F1=1,4,5
##D         F2=2,3
##D         ")
##D mod2 <- mirt::mirt(data, cmodel, verbose=TRUE)
##D print(mod2)
##D summary(mod2)
##D # extract coefficients
##D coef(mod2)
##D mirt.wrapper.coef(mod2)$coef
##D # extract posterior
##D post2 <- sirt::mirt.wrapper.posterior(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Extracting item parameters and posterior for differering
##D #            number of response catagories | Dataset Science
##D #############################################################################
##D 
##D data(Science,package="mirt")
##D library(psych)
##D psych::describe(Science)
##D 
##D # modify dataset
##D dat <- Science
##D dat[ dat[,1] > 3,1] <- 3
##D psych::describe(dat)
##D 
##D # estimate generalized partial credit model
##D mod1 <- mirt::mirt(dat, 1, itemtype="gpcm")
##D print(mod1)
##D # extract coefficients
##D coef(mod1)
##D mirt.wrapper.coef(mod1)$coef
##D # extract posterior
##D post1 <- sirt::mirt.wrapper.posterior(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Multiple group model; simulated dataset from mirt package
##D #############################################################################
##D 
##D #*** simulate data (copy from the multipleGroup manual site in mirt package)
##D set.seed(1234)
##D a <- matrix(c(abs( stats::rnorm(5,1,.3)), rep(0,15),abs( stats::rnorm(5,1,.3)),
##D           rep(0,15),abs( stats::rnorm(5,1,.3))), 15, 3)
##D d <- matrix( stats::rnorm(15,0,.7),ncol=1)
##D mu <- c(-.4, -.7, .1)
##D sigma <- matrix(c(1.21,.297,1.232,.297,.81,.252,1.232,.252,1.96),3,3)
##D itemtype <- rep("dich", nrow(a))
##D N <- 1000
##D dataset1 <- mirt::simdata(a, d, N, itemtype)
##D dataset2 <- mirt::simdata(a, d, N, itemtype, mu=mu, sigma=sigma)
##D dat <- rbind(dataset1, dataset2)
##D group <- c(rep("D1", N), rep("D2", N))
##D 
##D #group models
##D model <- mirt::mirt.model("
##D    F1=1-5
##D    F2=6-10
##D    F3=11-15
##D       ")
##D 
##D # separate analysis
##D mod_configural <- mirt::multipleGroup(dat, model, group=group, verbose=TRUE)
##D mirt.wrapper.coef(mod_configural)
##D 
##D # equal slopes (metric invariance)
##D mod_metric <- mirt::multipleGroup(dat, model, group=group, invariance=c("slopes"),
##D                 verbose=TRUE)
##D mirt.wrapper.coef(mod_metric)
##D 
##D # equal slopes and intercepts (scalar invariance)
##D mod_scalar <- mirt::multipleGroup(dat, model, group=group,
##D           invariance=c("slopes","intercepts","free_means","free_varcov"), verbose=TRUE)
##D mirt.wrapper.coef(mod_scalar)
##D 
##D # full constraint
##D mod_fullconstrain <- mirt::multipleGroup(dat, model, group=group,
##D              invariance=c("slopes", "intercepts"), verbose=TRUE )
##D mirt.wrapper.coef(mod_fullconstrain)
##D 
##D #############################################################################
##D # EXAMPLE 4: Nonlinear item response model
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D # specify mirt model with some interactions
##D mirtmodel <- mirt.model("
##D    A=1-4
##D    B=5-8
##D    C=9-12
##D    (A*B)=4,8
##D    (C*C)=9
##D    (A*B*C)=12
##D    " )
##D # estimate model
##D res <- mirt::mirt( dat, mirtmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D # look at estimated parameters
##D mirt.wrapper.coef(res)
##D coef(res)
##D mirt::mod2values(res)
##D # model specification
##D res@model
##D 
##D #############################################################################
##D # EXAMPLE 5: Extracting factor scores
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D # define lavaan model and convert syntax to mirt
##D lavmodel <- "
##D     A=~ a*A1+a*A2+1.3*A3+A4       # set loading of A3 to 1.3
##D     B=~ B1+1*B2+b3*B3+B4
##D     C=~ c*C1+C2+c*C3+C4
##D     A1 | da*t1
##D     A3 | da*t1
##D     C4 | dg*t1
##D     B1 | 0*t1
##D     B3 | -1.4*t1                  # fix item threshold of B3 to -1.4
##D     A ~~ B                        # estimate covariance between A and B
##D     A ~~ .6 * C                   # fix covariance to .6
##D     B ~~ B                        # estimate variance of B
##D     A ~ .5*1                      # set mean of A to .5
##D     B ~ 1                         # estimate mean of B
##D     "
##D res <- sirt::lavaan2mirt( dat, lavmodel, verbose=TRUE, technical=list(NCYCLES=3) )
##D # estimated coefficients
##D mirt.wrapper.coef(res$mirt)
##D # extract factor scores
##D fres <- sirt::mirt.wrapper.fscores(res$mirt)
##D # look at factor scores
##D head( round(fres$person,2))
##D   ##     case    M EAP.Var1 SE.EAP.Var1 EAP.Var2 SE.EAP.Var2 EAP.Var3 SE.EAP.Var3 MLE.Var1
##D   ##   1    1 0.92     1.26        0.67     1.61        0.60     0.05        0.69     2.65
##D   ##   2    2 0.58     0.06        0.59     1.14        0.55    -0.80        0.56     0.00
##D   ##   3    3 0.83     0.86        0.66     1.15        0.55     0.48        0.74     0.53
##D   ##   4    4 1.00     1.52        0.67     1.57        0.60     0.73        0.76     2.65
##D   ##   5    5 0.50    -0.13        0.58     0.85        0.48    -0.82        0.55    -0.53
##D   ##   6    6 0.75     0.41        0.63     1.09        0.54     0.27        0.71     0.00
##D   ##     MLE.Var2 MLE.Var3 MAP.Var1 MAP.Var2 MAP.Var3
##D   ##   1     2.65    -0.53     1.06     1.59     0.00
##D   ##   2     1.06    -1.06     0.00     1.06    -1.06
##D   ##   3     1.06     2.65     1.06     1.06     0.53
##D   ##   4     2.65     2.65     1.59     1.59     0.53
##D   ##   5     0.53    -1.06    -0.53     0.53    -1.06
##D   ##   6     1.06     2.65     0.53     1.06     0.00
##D # EAP reliabilities
##D round(fres$EAP.rel,3)
##D   ##    Var1  Var2  Var3
##D   ##   0.574 0.452 0.541
## End(Not run)



