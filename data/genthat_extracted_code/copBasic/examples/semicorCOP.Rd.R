library(copBasic)


### Name: semicorCOP
### Title: The Lower and Upper Semi-Correlations of a Copula
### Aliases: semicorCOP
### Keywords: copula (characteristics) copula (properties) copula (tail
###   characteristics) copula (tail properties) semi-correlation
###   coefficient Joe (2014) Examples and Exercises

### ** Examples

## Not run: 
##D # Gumbel-Hougaard copula with Pearson rhoN = 0.4 (by definition)
##D run <- sapply(1:20, function(i) semicorCOP(cop=GHcop, para=1.350, n=600))
##D mean(unlist(run[1,])) # cor.normal.scores
##D mean(unlist(run[2,])) # minus.semicor
##D mean(unlist(run[3,])) # plus.semicor
##D sd(  unlist(run[1,])) # cor.normal.scores (These are our sampling variations
##D sd(  unlist(run[2,])) # minus.semicor      for the n=600 used as a Monte
##D sd(  unlist(run[3,])) # plus.semicor       Carlo simulation.)
##D # The function returns:    rhoN = 0.3945714, rhoN-= 0.1312561, rhoN+= 0.4108908
##D #  standard deviations           (0.0378331)       (0.0744049)       (0.0684766)
##D # Joe (2014, p. 72) shows: rhoN = 0.4,       rhoN-= 0.132,     rhoN+= 0.415
##D #  standard deviations           (not avail)       (0.08)            (0.07)
##D # We see alignment with Joe's results with his n=600. #
## End(Not run)



