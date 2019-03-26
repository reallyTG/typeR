library(SpadeR)


### Name: SimilarityMult
### Title: Estimation of multiple-community similarity measures
### Aliases: SimilarityMult

### ** Examples

## Not run: 
##D data(SimilarityMultData)
##D # Type (1) abundance data 
##D SimilarityMult(SimilarityMultData$Abu,"abundance",q=2,nboot=200,"relative")
##D # Type (2) incidence-frequency data 
##D SimilarityMult(SimilarityMultData$Inci,"incidence_freq",q=2,nboot=200,"relative")
##D # Type (2B) incidence-raw data 
##D SimilarityMult(SimilarityMultData$Inci_raw,"incidence_raw",
##D units=c(19,17,15),q=2,nboot=200,"relative")
## End(Not run)



