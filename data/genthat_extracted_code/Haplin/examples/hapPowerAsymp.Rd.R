library(Haplin)


### Name: hapPowerAsymp
### Title: Asymptotic power calculations for genetic association analyses
###   with Haplin
### Aliases: hapPowerAsymp

### ** Examples

## Not run: 
##D ## Calculate the asymptotic power for a triad design 
##D ## when the minor allele increases the fetal risk by twofold.
##D ## Assumes a multiplicative dose-response relationship.
##D hapPowerAsymp(nall = c(2), n.strata = 1, cases = list(c(mfc=120)), 
##D haplo.freq = c(0.1,0.9), RR = c(2,1), RRstar = c(1,1))
##D 
##D ## Calculate the asymptotic power for the hybrid design when 
##D ## the minor allele increases the fetal risk by twofold 
##D ## in the first stratum and no effect is seen in the second
##D hapPowerAsymp(nall = c(2), n.strata = 2, cases = list(c(mfc=100)), 
##D controls = list(c(mfc=100)), haplo.freq = c(0.1,0.9), 
##D RR = list(c(2,1), c(1,1)), RRstar = c(1,1))
##D 
##D ## Calculate the asymptotic power assessing maternal- and
##D ## parent-of-origin effects at two diallelic loci.
##D hapPowerAsymp(nall = c(2,2), n.strata = 2, cases = c(mfc=500), 
##D haplo.freq = c(0.1,0.2,0.3,0.4), 
##D RRcm = list(c(3,1,1,1), c(1,1,1,1)), RRcf = c(1,1,1,1), RRstar = c(1,1,1,1),
##D RR.mat = list(c(1.5,1,1,1),c(1,1,1,1)), RRstar.mat = c(1,1,1,1))
## End(Not run)



