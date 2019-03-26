library(fishmethods)


### Name: irm_cr
### Title: Age-Independent Instantaneous Rates Model of Jiang et al. (2007)
###   Incorporating Catch and Release Tag Returns
### Aliases: irm_cr
### Keywords: misc

### ** Examples

## Data come from Appendix Table A2 and model structure from model (a) in
## Table 3.2 of Jiang (2005) 
## Example takes a bit of time to run
  ## Not run: 
##D   data(Jiang)
##D    model1<-irm_cr(relyrs = Jiang$relyrs, recapyrs = Jiang$recapyrs, 
##D      N = Jiang$N, recapharv = Jiang$recapharv, recaprel = Jiang$recaprel,
##D      hlambda = Jiang$hlambda, rlambda = Jiang$rlambda, hphi = Jiang$hphi,
##D      rphi = Jiang$rphi, hmrate = Jiang$hmrate, Fyr = Jiang$Fyr,
##D      FAyr = Jiang$FAyr, Myr = Jiang$Myr, initial = c(0.1,0.05,0.1), 
##D      lower = c(0.0001,0.0001,0.0001), upper=c(5,5,5),maxiter=10000)
##D   
## End(Not run)



