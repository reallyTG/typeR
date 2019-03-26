library(Interatrix)


### Name: chi2CorrAge
### Title: Searches for parasite interactions taking the cumulative effect
###   of age and other risk factors into account.
### Aliases: chi2CorrAge
### Keywords: hplot print htest interface

### ** Examples

## Not run: 
##D   library(Interatrix)
##D   data(dataInteratrix)
##D   res2 <- chi2CorrAge("F1+F2+AGE", dataInteratrix, "Parasite1", "Parasite2", "AGE", w1 = 0, 
##D     w2 = 0, mort = c(0.2, 0.2, 0.2), a = c(0, 1, 2, 10), nsimu = 500, nbcore = 2)
## End(Not run)



