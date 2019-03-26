library(TriMatch)


### Name: trips
### Title: Estimates propensity scores for three groups
### Aliases: trips

### ** Examples

## Not run: 
##D data(tutoring)
##D formu <- ~ Gender + Ethnicity + Military + ESL + EdMother + EdFather + Age +
##D      Employment + Income + Transfer + GPA
##D tpsa <- trips(tutoring, tutoring$treat, formu)
##D head(tpsa)
## End(Not run)



