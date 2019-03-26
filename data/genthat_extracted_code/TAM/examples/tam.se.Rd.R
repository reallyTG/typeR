library(TAM)


### Name: tam.se
### Title: Standard Error Estimation
### Aliases: tam.se tam_mml_se_quick tam_latreg_se_quick
### Keywords: Standard errors

### ** Examples

#############################################################################
# EXAMPLE 1: 1PL model, data.sim.rasch
#############################################################################

data(data.sim.rasch)
# estimate Rasch model
mod1 <- TAM::tam.mml(resp=data.sim.rasch[1:500,1:10])
# standard error estimation
se1 <- TAM::tam.se( mod1 )
# proportion of standard errors estimated by 'tam.se' and 'tam.mml'
prop1 <- se1$xsi$se / mod1$xsi$se
##   > summary( prop1 )
##      Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##     1.030   1.034   1.035   1.036   1.039   1.042
##=> standard errors estimated by tam.se are a bit larger

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Standard errors differential item functioning
##D #############################################################################
##D data(data.ex08)
##D 
##D formulaA <- ~ item*female
##D resp <- data.ex08[["resp"]]
##D facets <- as.data.frame( data.ex08[["facets"]] )
##D # investigate DIF
##D mod <- TAM::tam.mml.mfr( resp=resp, facets=facets, formulaA=formulaA )
##D summary(mod)
##D # estimate standard errors
##D semod <- TAM::tam.se(mod)
##D prop1 <- semod$xsi$se / mod$xsi$se
##D summary(prop1)
##D # plot differences in standard errors
##D plot( mod$xsi$se, semod$xsi$se, pch=16, xlim=c(0,.15), ylim=c(0,.15),
##D     xlab="Standard error 'tam.mml'", ylab="Standard error 'tam.se'" )
##D lines( c(-6,6), c(-6,6), col="gray")
##D 
##D round( cbind( mod$xsi, semod$xsi[,-1] ), 3 )
##D   ##                    xsi se.xsi   N    est    se
##D   ##   I0001         -1.956  0.092 500 -1.956 0.095
##D   ##   I0002         -1.669  0.085 500 -1.669 0.088
##D   ##   [...]
##D   ##   I0010          2.515  0.108 500  2.515 0.110
##D   ##   female1       -0.091  0.025 500 -0.091 0.041
##D   ##   I0001:female1 -0.051  0.070 500 -0.051 0.071
##D   ##   I0002:female1  0.085  0.067 500  0.085 0.068
##D   ##   [...]
##D   ##   I0009:female1 -0.019  0.068 500 -0.019 0.068
##D   ##
##D #=> The largest discrepancy in standard errors is observed for the
##D #    main female effect (.041 in 'tam.se' instead of .025 in 'tam.mml')
## End(Not run)



