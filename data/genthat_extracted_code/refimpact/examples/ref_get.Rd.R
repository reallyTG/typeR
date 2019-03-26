library(refimpact)


### Name: ref_get
### Title: Call the REF Impact Case Studies API
### Aliases: ref_get

### ** Examples

## No test: 
institutions <- ref_get("ListInstitutions")
units_of_assessment <- ref_get("ListUnitsOfAssessment")
tag_types <- ref_get("ListTagTypes")
tag_type_5 <- ref_get("ListTagValues", 5L)
ref_get("SearchCaseStudies", query = list(ID     = c(27121,1698)))
ref_get("SearchCaseStudies", query = list(UKPRN  = 10007777))
ref_get("SearchCaseStudies", query = list(UoA    = 5))
ref_get("SearchCaseStudies", query = list(tags   = c(11280, 5085)))
ref_get("SearchCaseStudies", query = list(phrase = "hello"))
ref_get("SearchCaseStudies", query = list(UKPRN  = 10007146, UoA = 3))
## End(No test)




