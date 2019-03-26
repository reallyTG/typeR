library(lmomRFA)


### Name: regsimh
### Title: Simulate the distribution of heterogeneity and goodness-of-fit
###   measures
### Aliases: regsimh print.regsimh
### Keywords: misc

### ** Examples

## Not run: 
##D  ##D 
##D data(Cascades)            # A regional data set
##D 
##D rmom<-regavlmom(Cascades) # Regional average L-moments
##D 
##D # Set up an artificial region to be simulated:
##D # -- Same number of sites as Cascades
##D # -- Same record lengths as Cascades
##D # -- Mean 1 at every site (results do not depend on the site means)
##D # -- L-CV varies linearly across sites, with mean value equal
##D #    to the regional average L-CV for the Cascades data.
##D #    'LCVrange' specifies the  range of L-CV across the sites.
##D # -- L-skewness the same at each site, and equal to the regional
##D #    average L-skewness for the Cascades data
##D nsites <- nrow(Cascades)
##D means <- rep(1,nsites)
##D LCVrange <- 0.025
##D LCVs <- seq(rmom[2]-LCVrange/2, rmom[2]+LCVrange/2, len=nsites)
##D Lskews<-rep(rmom[3], nsites)
##D 
##D # Each site will have a generalized normal distribution:
##D # get the parameter values for each site
##D pp <- t(apply(cbind(means, means*LCVs ,Lskews), 1, pelgno))
##D 
##D # Set correlation between each pair of sites to 0.64, the
##D # average inter-site correlation for the Cascades data
##D avcor <- 0.64
##D 
##D # Run the simulation.  It will take some time (about 25 sec
##D # on a Lenovo W500, a moderately fast 2011-vintage laptop)
##D # Note that the results are consistent with the statement
##D # "the average H value of simulated regions is 1.08"
##D # in Hosking and Wallis (1997, p.98).
##D set.seed(123)
##D regsimh(qfunc=quagno, para=pp, cor=avcor, nrec=Cascades$n,
##D   nrep=100)
## End(Not run)


