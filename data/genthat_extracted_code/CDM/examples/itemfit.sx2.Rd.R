library(CDM)


### Name: itemfit.sx2
### Title: S-X2 Item Fit Statistic for Dichotomous Data
### Aliases: itemfit.sx2 summary.itemfit.sx2 plot.itemfit.sx2
### Keywords: Item fit summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Items with unequal item slopes
#############################################################################

# simulate data
set.seed(9871)
I <- 11
b <- seq( -1.5, 1.5, length=I)
a <- rep(1,I)
a[4] <- .4
N <- 1000
library(sirt)
dat <- sirt::sim.raschtype( theta=stats::rnorm(N), b=b, fixed.a=a)

#*** 1PL model estimated with gdm
mod1 <- CDM::gdm( dat, theta.k=seq(-6,6,len=21), irtmodel="1PL" )
summary(mod1)
# estimate item fit statistic
fitmod1 <- CDM::itemfit.sx2(mod1)
summary(fitmod1)
  ##       item itemindex   S-X2 df     p S-X2_df RMSEA Nscgr Npars p.holm
  ##   1  I0001         1  4.173  9 0.900   0.464 0.000    10     1  1.000
  ##   2  I0002         2 12.365  9 0.193   1.374 0.019    10     1  1.000
  ##   3  I0003         3  6.158  9 0.724   0.684 0.000    10     1  1.000
  ##   4  I0004         4 37.759  9 0.000   4.195 0.057    10     1  0.000
  ##   5  I0005         5 12.307  9 0.197   1.367 0.019    10     1  1.000
  ##   6  I0006         6 19.358  9 0.022   2.151 0.034    10     1  0.223
  ##   7  I0007         7 14.610  9 0.102   1.623 0.025    10     1  0.818
  ##   8  I0008         8 15.568  9 0.076   1.730 0.027    10     1  0.688
  ##   9  I0009         9  8.471  9 0.487   0.941 0.000    10     1  1.000
  ##   10 I0010        10  8.330  9 0.501   0.926 0.000    10     1  1.000
  ##   11 I0011        11 12.351  9 0.194   1.372 0.019    10     1  1.000
  ##
  ##   -- Average Item Fit Statistics --
  ##   S-X2=13.768 | S-X2_df=1.53
# -> 4th item does not fit to the 1PL model

# plot item fit
plot(fitmod1)

## Not run: 
##D #*** 2PL model estimated with gdm
##D mod2 <- CDM::gdm( dat, theta.k=seq(-6,6,len=21), irtmodel="2PL", maxiter=100 )
##D summary(mod2)
##D # estimate item fit statistic
##D fitmod2 <- CDM::itemfit.sx2(mod2)
##D summary(fitmod2)
##D   ##       item itemindex   S-X2 df     p S-X2_df RMSEA Nscgr Npars p.holm
##D   ##   1  I0001         1  4.083  8 0.850   0.510 0.000    10     2  1.000
##D   ##   2  I0002         2 13.580  8 0.093   1.697 0.026    10     2  0.747
##D   ##   3  I0003         3  6.236  8 0.621   0.780 0.000    10     2  1.000
##D   ##   4  I0004         4  6.049  8 0.642   0.756 0.000    10     2  1.000
##D   ##   5  I0005         5 12.792  8 0.119   1.599 0.024    10     2  0.834
##D   ##   6  I0006         6 14.397  8 0.072   1.800 0.028    10     2  0.648
##D   ##   7  I0007         7 15.046  8 0.058   1.881 0.030    10     2  0.639
##D   ##   [...]
##D   ##
##D   ##   -- Average Item Fit Statistics --
##D   ##   S-X2=10.22 | S-X2_df=1.277
##D 
##D #*** 1PL model estimation in smirt (sirt package)
##D Qmatrix <- matrix(1, nrow=I, ncol=1 )
##D mod1a <- sirt::smirt( dat, Qmatrix=Qmatrix )
##D summary(mod1a)
##D # item fit statistic
##D fitmod1a <- CDM::itemfit.sx2(mod1a)
##D summary(fitmod1a)
##D 
##D #*** 2PL model estimation in smirt (sirt package)
##D mod2a <- sirt::smirt( dat, Qmatrix=Qmatrix, est.a="2PL")
##D summary(mod2a)
##D # item fit statistic
##D fitmod2a <- CDM::itemfit.sx2(mod2a)
##D summary(fitmod2a)
##D 
##D #*** 1PL model estimated with rasch.mml2 (in sirt)
##D mod1b <- sirt::rasch.mml2(dat)
##D summary(mod1b)
##D # estimate item fit statistic
##D fitmod1b <- CDM::itemfit.sx2(mod1b)
##D summary(fitmod1b)
##D 
##D #*** 1PL estimated in TAM
##D library(TAM)
##D mod1c <- TAM::tam.mml( resp=dat )
##D summary(mod1c)
##D # item fit
##D summary( CDM::itemfit.sx2( mod1c) )
##D # conversion to mirt object
##D library(sirt)
##D library(mirt)
##D cmod1c <- sirt::tam2mirt( mod1c )
##D # item fit in mirt
##D mirt::itemfit( cmod1c$mirt )
##D 
##D #*** 2PL estimated in TAM
##D mod2c <- TAM::tam.mml.2pl( resp=dat )
##D summary(mod2c)
##D # item fit
##D summary( CDM::itemfit.sx2( mod2c) )
##D # conversion to mirt object and item fit in mirt
##D cmod2c <- sirt::tam2mirt( mod2c )
##D mirt::itemfit( cmod2c$mirt )
##D 
##D # estimation in mirt
##D mod1d <- mirt::mirt( dat, 1, itemtype="Rasch" )
##D mirt::itemfit( mod1d )    # compute item fit
##D 
##D #############################################################################
##D # EXAMPLE 2: Item fit statistics sim.dina dataset
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #*** Model 1: DINA model (correctly specified model)
##D mod1 <- CDM::din( data=sim.dina, q.matrix=sim.qmatrix )
##D summary(mod1)
##D # item fit statistic
##D summary( CDM::itemfit.sx2( mod1 ) )
##D   ##   -- Average Item Fit Statistics --
##D   ##   S-X2=7.397 | S-X2_df=1.233
##D 
##D #*** Model 2: Mixed DINA/DINO model
##D #***  1th item is misspecified according to DINO rule
##D I <- ncol(CDM::sim.dina)
##D rule <- rep("DINA", I )
##D rule[1] <- "DINO"
##D mod2 <- CDM::din( data=CDM::sim.dina, q.matrix=CDM::sim.qmatrix, rule=rule)
##D summary(mod2)
##D # item fit statistic
##D summary( CDM::itemfit.sx2( mod2 ) )
##D   ##   -- Average Item Fit Statistics --
##D   ##   S-X2=9.925 | S-X2_df=1.654
##D 
##D #*** Model 3: Additive GDINA model
##D mod3 <- CDM::gdina( data=CDM::sim.dina, q.matrix=CDM::sim.qmatrix, rule="ACDM")
##D summary(mod3)
##D # item fit statistic
##D summary( CDM::itemfit.sx2( mod3 ) )
##D   ##   -- Average Item Fit Statistics --
##D   ##   S-X2=8.416 | S-X2_df=1.678
## End(Not run)



