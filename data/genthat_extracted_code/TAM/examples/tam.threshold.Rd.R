library(TAM)


### Name: tam.threshold
### Title: Calculation of Thurstonian Thresholds
### Aliases: tam.threshold
### Keywords: Thurstonian thresholds

### ** Examples

#############################################################################
# EXAMPLE 1: ordered data - Partial credit model
#############################################################################
data( data.gpcm )

# Model 1: partial credit model
mod1 <- TAM::tam.mml( resp=data.gpcm,control=list( maxiter=200) )
summary(mod1)
  ##   Item Parameters -A*Xsi
  ##        item   N     M AXsi_.Cat1 AXsi_.Cat2 AXsi_.Cat3 B.Cat1.Dim1 B.Cat2.Dim1 B.Cat3.Dim1
  ##   1 Comfort 392 0.880     -1.302      1.154      3.881           1           2           3
  ##   2    Work 392 1.278     -1.706     -0.847      0.833           1           2           3
  ##   3 Benefit 392 1.163     -1.233     -0.404      1.806           1           2           3

# Calculation of Thurstonian thresholds
TAM::tam.threshold(mod1)
  ##                Cat1      Cat2     Cat3
  ##   Comfort -1.325226 2.0717468 3.139801
  ##   Work    -1.777679 0.6459045 1.971222
  ##   Benefit -1.343536 0.7491760 2.403168

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Multidimensional model data.math
##D #############################################################################
##D 
##D library(sirt)
##D data(data.math, package="sirt")
##D dat <- data.math$data
##D # select items
##D items1 <- grep("M[A-D]", colnames(dat), value=TRUE)
##D items2 <- grep("M[H-I]", colnames(dat), value=TRUE)
##D # select dataset
##D dat <- dat[ c(items1,items2)]
##D # create Q-matrix
##D Q <- matrix( 0, nrow=ncol(dat), ncol=2 )
##D Q[ seq(1,length(items1) ), 1 ] <- 1
##D Q[ length(items1) + seq(1,length(items2) ), 2 ] <- 1
##D 
##D # fit two-dimensional model
##D mod1 <- TAM::tam.mml( dat, Q=Q )
##D # compute thresholds (specify a probability level of .625)
##D tmod1 <- TAM::tam.threshold( mod1, prob.lvl=.625 )
##D 
##D #############################################################################
##D # EXAMPLE 3: Creating Wright maps with the WrightMap package
##D #############################################################################
##D 
##D library(WrightMap)
##D # For conducting Wright maps in combination with TAM, see
##D # http://wrightmap.org/post/100850738072/using-wrightmap-with-the-tam-package
##D data(sim.rasch)
##D dat <- sim.rasch
##D 
##D # estimate Rasch model in TAM
##D mod1 <- TAM::tam.mml(dat)
##D summary(mod1)
##D 
##D #--- A: creating a Wright map with WLEs
##D 
##D # compute WLE
##D wlemod1 <- TAM::tam.wle(mod1)$theta
##D # extract thresholds
##D tmod1 <- TAM::tam.threshold(mod1)
##D # create Wright map
##D WrightMap::wrightMap( thetas=wlemod1, thresholds=tmod1, label.items.srt=-90)
##D 
##D #--- B: creating a Wright Map with population distribution
##D 
##D # extract ability distribution and replicate observations
##D uni.proficiency <- rep( mod1$theta[,1], round( mod1$pi.k * mod1$ic$n) )
##D # draw WrightMap
##D WrightMap::wrightMap( thetas=uni.proficiency, thresholds=tmod1, label.items.rows=3)
## End(Not run)



