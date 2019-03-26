library(sirt)


### Name: dif.logistic.regression
### Title: Differential Item Functioning using Logistic Regression Analysis
### Aliases: dif.logistic.regression
### Keywords: Differential item functioning (DIF)

### ** Examples

#############################################################################
# EXAMPLE 1: Mathematics data | Gender DIF
#############################################################################

data( data.math )
dat <- data.math$data
items <- grep( "M", colnames(dat))

# estimate item parameters and WLEs
mod <- sirt::rasch.mml2( dat[,items] )
wle <- sirt::wle.rasch( dat[,items], b=mod$item$b )$theta

# assess DIF by logistic regression
mod1 <- sirt::dif.logistic.regression( dat=dat[,items], score=wle, group=dat$female)

# calculate DIF variance
dif1 <- sirt::dif.variance( dif=mod1$uniformDIF, se.dif=mod1$se.uniformDIF )
dif1$unweighted.DIFSD
  ## > dif1$unweighted.DIFSD
  ## [1] 0.1963958

# calculate stratified DIF variance
# stratification based on domains
dif2 <- sirt::dif.strata.variance( dif=mod1$uniformDIF, se.dif=mod1$se.uniformDIF,
              itemcluster=data.math$item$domain )
  ## $unweighted.DIFSD
  ## [1] 0.1455916

## Not run: 
##D #****
##D # Likelihood ratio test and graphical model test in eRm package
##D miceadds::library_install("eRm")
##D # estimate Rasch model
##D res <- eRm::RM( dat[,items] )
##D summary(res)
##D # LR-test with respect to female
##D lrres <- eRm::LRtest(res, splitcr=dat$female)
##D summary(lrres)
##D # graphical model test
##D eRm::plotGOF(lrres)
##D 
##D #############################################################################
##D # EXAMPLE 2: Comparison with Mantel-Haenszel test
##D #############################################################################
##D 
##D library(TAM)
##D library(difR)
##D 
##D #*** (1) simulate data
##D set.seed(776)
##D N <- 1500   # number of persons per group
##D I <- 12     # number of items
##D mu2 <- .5   # impact (group difference)
##D sd2 <- 1.3  # standard deviation group 2
##D 
##D # define item difficulties
##D b <- seq( -1.5, 1.5, length=I)
##D # simulate DIF effects
##D bdif <- scale( stats::rnorm(I, sd=.6 ), scale=FALSE )[,1]
##D # item difficulties per group
##D b1 <- b + 1/2 * bdif
##D b2 <- b - 1/2 * bdif
##D # simulate item responses
##D dat1 <- sirt::sim.raschtype( theta=stats::rnorm(N, mean=0, sd=1 ), b=b1 )
##D dat2 <- sirt::sim.raschtype( theta=stats::rnorm(N, mean=mu2, sd=sd2 ), b=b2 )
##D dat <- rbind( dat1, dat2 )
##D group <- rep( c(1,2), each=N ) # define group indicator
##D 
##D #*** (2) scale data
##D mod <- TAM::tam.mml( dat, group=group )
##D summary(mod)
##D 
##D #*** (3) extract person parameter estimates
##D mod_eap <- mod$person$EAP
##D mod_wle <- tam.wle( mod )$theta
##D 
##D #*********************************
##D # (4) techniques for assessing differential item functioning
##D 
##D # Model 1: assess DIF by logistic regression and WLEs
##D dif1 <- sirt::dif.logistic.regression( dat=dat, score=mod_wle, group=group)
##D # Model 2: assess DIF by logistic regression and EAPs
##D dif2 <- sirt::dif.logistic.regression( dat=dat, score=mod_eap, group=group)
##D # Model 3: assess DIF by Mantel-Haenszel statistic
##D dif3 <- difR::difMH(Data=dat, group=group, focal.name="1",  purify=FALSE )
##D print(dif3)
##D   ##  Mantel-Haenszel Chi-square statistic:
##D   ##
##D   ##        Stat.    P-value
##D   ##  I0001  14.5655   0.0001 ***
##D   ##  I0002 300.3225   0.0000 ***
##D   ##  I0003   2.7160   0.0993 .
##D   ##  I0004 191.6925   0.0000 ***
##D   ##  I0005   0.0011   0.9740
##D   ##  [...]
##D   ##  Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##D   ##  Detection threshold: 3.8415 (significance level: 0.05)
##D   ##
##D   ##  Effect size (ETS Delta scale):
##D   ##
##D   ##  Effect size code:
##D   ##   'A': negligible effect
##D   ##   'B': moderate effect
##D   ##   'C': large effect
##D   ##
##D   ##        alphaMH deltaMH
##D   ##  I0001  1.3908 -0.7752 A
##D   ##  I0002  0.2339  3.4147 C
##D   ##  I0003  1.1407 -0.3093 A
##D   ##  I0004  2.8515 -2.4625 C
##D   ##  I0005  1.0050 -0.0118 A
##D   ##  [...]
##D   ##
##D   ##  Effect size codes: 0 'A' 1.0 'B' 1.5 'C'
##D   ##   (for absolute values of 'deltaMH')
##D 
##D # recompute DIF parameter from alphaMH
##D uniformDIF3 <- log(dif3$alphaMH)
##D 
##D # compare different DIF statistics
##D dfr <- data.frame( "bdif"=bdif, "LR_wle"=dif1$uniformDIF,
##D         "LR_eap"=dif2$uniformDIF, "MH"=uniformDIF3 )
##D round( dfr, 3 )
##D   ##       bdif LR_wle LR_eap     MH
##D   ##  1   0.236  0.319  0.278  0.330
##D   ##  2  -1.149 -1.473 -1.523 -1.453
##D   ##  3   0.140  0.122  0.038  0.132
##D   ##  4   0.957  1.048  0.938  1.048
##D   ##  [...]
##D colMeans( abs( dfr[,-1] - bdif ))
##D   ##      LR_wle     LR_eap         MH
##D   ##  0.07759187 0.19085743 0.07501708
## End(Not run)



