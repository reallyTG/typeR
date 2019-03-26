library(phenology)


### Name: ECFOCF_f
### Title: Calculate a table of probabilities of ECF and OCF.
### Aliases: ECFOCF_f

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D modelECFOCF <- ECFOCF_f(mu=5.58013243236187, 
##D                     sd=1.225581130238, 
##D                     p=invlogit(1.3578137414575), 
##D                     MaxNests=15)
##D plot(modelECFOCF)
##D modelECFOCF <- ECFOCF_f(mu=5.58013243236187, 
##D                     sd=1.225581130238, 
##D                     mu_season=12, 
##D                     sd_season=2, 
##D                     p=c(p1=invlogit(1.3578137414575)), 
##D                     MaxNests=15, 
##D                     MeanDaysBetween2Nests=9.8, 
##D                     length_season=floor(365/9.8)+1
##D                     )
##D plot(modelECFOCF, period=2)
## End(Not run)



