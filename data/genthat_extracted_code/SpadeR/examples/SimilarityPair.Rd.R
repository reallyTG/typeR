library(SpadeR)


### Name: SimilarityPair
### Title: Estimation of two-assemblage similarity measures
### Aliases: SimilarityPair

### ** Examples

## Not run: 
##D data(SimilarityPairData)
##D # Type (1) abundance data 
##D SimilarityPair(SimilarityPairData$Abu,"abundance",nboot=200)
##D # Type (2) incidence-frequency data 
##D SimilarityPair(SimilarityPairData$Inci,"incidence_freq",nboot=200)
##D # Type (2B) incidence-raw data 
##D SimilarityPair(SimilarityPairData$Inci_raw,"incidence_raw",units=c(19,17),nboot=200)
## End(Not run)



