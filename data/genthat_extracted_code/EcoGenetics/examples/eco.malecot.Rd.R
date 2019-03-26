library(EcoGenetics)


### Name: eco.malecot
### Title: Global and local kinship analysis
### Aliases: eco.malecot

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # ---global analysis---
##D 
##D globaltest <- eco.malecot(eco=eco, method = "global", smax=10,
##D                          size=1000)
##D eco.plotCorrelog(globaltest)    # Significant mean class coancestry classes at   
##D                     # individual level (alpha = 0.05, 
##D                     # out of the red area), 
##D                     # and family-wise P corrected values (red-blue
##D                     # points, indicated in the legend)
##D 
##D # ecoslot.SP(globaltest) contains:
##D # - the slope (bhat) and values with confidence intervals
##D #  of the regression reg = kinship ~ ln(distance_between_individuals)
##D #- A Mantel test result for assesing the relation between
##D #  between  kinship and ln(distance_between_individuals)
##D #- A cubic interpolation between the residuals of reg and 
##D #  ln(distance_between_individuals)
##D #- the sp statistic and its confidence interval
##D 
##D # ecoslot.OUT(globaltest) contains:
##D # - In permutation case, the values of mean and log-mean distance    
##D #   classes; observed class value; expected + alternative + P value,
##D #   the bootstrap null confidence intervals and 
##D #   jackknife statistics (jackknifed mean, jackknifed SD, and
##D #                         CI for the class statistic)
##D 
##D # - In bootstrap case, the values of mean and log-mean distance
##D #   classes;the bootstrap null confidence intervals and 
##D #   jackknife statistics (jackknifed mean, jackknifed SD, and
##D #                         CI for the class statistic)
##D 
##D 
##D # A directional approach based in bearing correlograms, 30 degrees
##D globaltest_30 <- eco.malecot(eco=eco, method = "global", smax=10,
##D                          size=1000, angle = 30)
##D eco.plotCorrelog(globaltest) 
##D 
##D #----------------------------------------------------------#
##D # ---local analysis---
##D 
##D 
##D # (using the spatial weights). 
##D 
##D # ---local analysis with k nearest neighbors---
##D 
##D 
##D 
##D localktest <- eco.malecot(eco=eco, method = "local",
##D                          type = "knearest", kmax = 5, 
##D                          adjust = "none")
##D eco.plotLocal(localktest)
##D 
##D 
##D # ---local analysis with radial distance---
##D 
##D localdtest <- eco.malecot(eco=eco, method = "local",
##D                         type = "radialdist", smax = 3, 
##D                         adjust = "none")
##D                         
##D eco.plotLocal(localdtest)                    # rankplot graphic (see ?"eco.rankplot")
##D 
##D                                          # Significant values
##D                                          # in blue-red scale, 
##D                                          # non significant 
##D                                          # values in yellow
##D 
##D eco.plotLocal(localktest, significant = FALSE)    # significant and non
##D                                               # signficant values
##D                                               # in blue-red scale
##D 
##D # The slot OUT of localktest (ecoslot.OUT(localktest)) and localdtest 
##D # (ecoslot.OUT(localdtest)) contains:
##D # - the mean distance per individual, observed value of the
##D #   statistic, expected + alternative + P value + null hypotesis
##D #   confidence intervals,  or boostrap confidence intervals in 
##D #   permutation or bootstrap cases, respectively.
## End(Not run)




