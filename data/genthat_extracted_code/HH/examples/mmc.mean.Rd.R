library(HH)


### Name: mmc.mean
### Title: MMC (Mean-mean Multiple Comparisons) plots from the sufficient
###   statistics for a one-way design.
### Aliases: mmc.mean multicomp.mean multicomp.mmc.mean
### Keywords: hplot htest

### ** Examples

## This example is from Hsu and Peruggia

## This is the S-Plus version
## See ?aovSufficient for R

if.R(r={},
s={

data(pulmonary)
pulmonary.aov <- aovSufficient(FVC ~ smoker,
                               data=pulmonary)
summary(pulmonary.aov)


## multicomp object
pulmonary.mca <-
multicomp.mean(pulmonary$smoker,
               pulmonary$n,
               pulmonary$FVC,
               pulmonary$s,
               ylabel="pulmonary",
               focus="smoker")


pulmonary.mca
## lexicographic ordering of contrasts, some positive and some negative
plot(pulmonary.mca)



pulm.lmat <- cbind("npnl-mh"=c( 1, 1, 1, 1,-2,-2), ## not.much vs lots
                   "n-pnl"  =c( 3,-1,-1,-1, 0, 0), ## none vs light
                   "p-nl"   =c( 0, 2,-1,-1, 0, 0), ## {} arbitrary 2 df
                   "n-l"    =c( 0, 0, 1,-1, 0, 0), ## {} for 3 types of light
                   "m-h"    =c( 0, 0, 0, 0, 1,-1)) ## moderate vs heavy
dimnames(pulm.lmat)[[1]] <- row.names(pulmonary)
pulm.lmat


## mmc.multicomp object
pulmonary.mmc <-
multicomp.mmc.mean(pulmonary$smoker,
                   pulmonary$n,
                   pulmonary$FVC,
                   pulmonary$s,
                   ylabel="pulmonary",
                   focus="smoker",
                   lmat=pulm.lmat,
                   plot=FALSE)


old.omd <- par(omd=c(0,.95, 0,1))

## pairwise comparisons
plot(pulmonary.mmc, print.mca=TRUE, print.lmat=FALSE)

## tiebreaker plot, with contrasts ordered to match MMC plot,
## with all contrasts forced positive and with names also reversed,
## and with matched x-scale.
plotMatchMMC(pulmonary.mmc$mca)

## orthogonal contrasts
plot(pulmonary.mmc)

## pairwise and orthogonal contrasts on the same plot
plot(pulmonary.mmc, print.mca=TRUE, print.lmat=TRUE)

par(old.omd)
})



