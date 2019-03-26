library(TriMatch)


### Name: trimatch
### Title: Creates matched triplets.
### Aliases: trimatch

### ** Examples

## Not run: 
##D data(turoing)
##D formu <- ~ Gender + Ethnicity + Military + ESL + EdMother + EdFather + Age +
##D      Employment + Income + Transfer + GPA
##D tpsa <- trips(tutoring, tutoring$treat, formu)
##D tmatch <- trimatch(tpsa, status=FALSE)
## End(Not run)



