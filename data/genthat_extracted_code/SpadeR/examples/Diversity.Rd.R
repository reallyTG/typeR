library(SpadeR)


### Name: Diversity
### Title: Estimation of species diversity (Hill numbers)
### Aliases: Diversity

### ** Examples

## Not run: 
##D data(DiversityData)
##D # Type (1) abundance data 
##D Diversity(DiversityData$Abu,"abundance",q=c(0,0.5,1,1.5,2))
##D # Type (1A) abundance-frequency counts data 
##D Diversity(DiversityData$Abu_count,"abundance_freq_count",q=seq(0,3,by=0.5))
##D # Type (2) incidence-frequency data 
##D Diversity(DiversityData$Inci,"incidence_freq",q=NULL)
##D # Type (2A) incidence-frequency counts data 
##D Diversity(DiversityData$Inci_freq_count,"incidence_freq_count",q=NULL)
##D # Type (2B) incidence-raw data 
##D Diversity(DiversityData$Inci_raw,"incidence_raw",q=NULL)
## End(Not run)



