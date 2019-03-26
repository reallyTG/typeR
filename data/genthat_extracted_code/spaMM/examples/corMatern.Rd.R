library(spaMM)


### Name: corMatern
### Title: Matern Correlation Structure as a corSpatial object
### Aliases: corMatern Initialize.corMatern Variogram.corMatern
###   coef.corMatern coef<-.corMatern corFactor.corMatern
###   corMatrix.corMatern getCovariate.corMatern logDet.corMatern
###   recalc.corMatern

### ** Examples

## LMM
data("blackcap")
blackcapD <- cbind(blackcap,dummy=1) ## obscure, isn't it? 
## With method= 'ML' in lme, The correlated random effect is described 
##  as a correlated residual error and no extra residual variance is fitted:
nlme::lme(fixed = migStatus ~ means, data = blackcapD, random = ~ 1 | dummy, 
    correlation = corMatern(form = ~ longitude+latitude  | dummy), 
    method = "ML", control=nlme::lmeControl(sing.tol=1e-20))

## Binomial GLMM
if (spaMM.getOption("example_maxtime")>32) {
 data("Loaloa")
 LoaloaD <- cbind(Loaloa,dummy=1) 
 MASS::glmmPQL(fixed =cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI, 
        data = LoaloaD, random = ~ 1 | dummy,family=binomial, 
        correlation = corMatern(form = ~ longitude+latitude | dummy))
}



