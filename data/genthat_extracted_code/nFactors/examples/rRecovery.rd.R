library(nFactors)


### Name: rRecovery
### Title: Test of Recovery of a Correlation or a Covariance matrix from a
###   Factor Analysis Solution
### Aliases: rRecovery
### Keywords: utilities

### ** Examples

# .......................................................
# Example from Kim and Mueller (1978, p. 10)
# Population: upper diagonal
# Simulated sample: lower diagnonal
 R <- matrix(c( 1.000, .6008, .4984, .1920, .1959, .3466,
                .5600, 1.000, .4749, .2196, .1912, .2979,
                .4800, .4200, 1.000, .2079, .2010, .2445,
                .2240, .1960, .1680, 1.000, .4334, .3197,
                .1920, .1680, .1440, .4200, 1.000, .4207,
                .1600, .1400, .1200, .3500, .3000, 1.000),
                nrow=6, byrow=TRUE)


# Replace upper diagonal with lower diagonal
 RU         <- diagReplace(R, upper=TRUE)
 nFactors   <- 2
 loadings   <- principalAxis(RU, nFactors=nFactors,
                             communalities="component")$loadings
 rComponent <- rRecovery(RU,loadings, diagCommunalities=FALSE)$cor

 loadings   <- principalAxis(RU, nFactors=nFactors,
                             communalities="maxr")$loadings
 rMaxr      <- rRecovery(RU,loadings, diagCommunalities=FALSE)$cor

 loadings   <- principalAxis(RU, nFactors=nFactors,
                             communalities="multiple")$loadings
 rMultiple  <- rRecovery(RU,loadings, diagCommunalities=FALSE)$cor

 round(c(rComponent = rComponent,
         rmaxr      = rMaxr,
         rMultiple  = rMultiple), 3)
# .......................................................

 


