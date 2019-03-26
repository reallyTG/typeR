library(HH)


### Name: aovSufficient
### Title: Analysis of variance from sufficient statistics for groups.
### Aliases: aovSufficient vcovSufficient
### Keywords: htest

### ** Examples

## This example is from Hsu and Peruggia

## This is the R version
## See ?mmc.mean for S-Plus

if.R(s={},
r={

data(pulmonary)
pulmonary
pulmonary.aov <- aovSufficient(FVC ~ smoker,
                                data=pulmonary)
summary(pulmonary.aov)

## Not run: 
##D pulmonary.mmc <- mmc(pulmonary.aov,
##D                      linfct=mcp(smoker="Tukey"),
##D                      df=pulmonary.aov$df.residual,
##D                      vcov.=vcovSufficient)
##D mmcplot(pulmonary.mmc, style="both")
##D 
##D ## orthogonal contrasts
##D pulm.lmat <- cbind("npnl-mh"=c( 1, 1, 1, 1,-2,-2), ## not.much vs lots
##D                    "n-pnl"  =c( 3,-1,-1,-1, 0, 0), ## none vs light
##D                    "p-nl"   =c( 0, 2,-1,-1, 0, 0), ## {} arbitrary 2 df
##D                    "n-l"    =c( 0, 0, 1,-1, 0, 0), ## {} for 3 types of light
##D                    "m-h"    =c( 0, 0, 0, 0, 1,-1)) ## moderate vs heavy
##D dimnames(pulm.lmat)[[1]] <- row.names(pulmonary)
##D pulm.lmat
##D 
##D pulmonary.mmc <- mmc(pulmonary.aov,
##D                      linfct=mcp(smoker="Tukey"),
##D                      df=pulmonary.aov$df.residual,
##D                      vcov.=vcovSufficient,
##D                      focus.lmat=pulm.lmat)
##D 
##D mmcplot(pulmonary.mmc, style="both", type="lmat")
## End(Not run)
})



