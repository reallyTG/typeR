## ----message=FALSE-------------------------------------------------------
library(refimpact)

## ------------------------------------------------------------------------
results <- ref_get("SearchCaseStudies", query=list(ID=941))
print(results)

## ------------------------------------------------------------------------
cat(results[[1, "CaseStudyId"]])
cat(results[[1, "Title"]])
cat(strtrim(results[[1, "ImpactSummary"]], width = 200), "<truncated>")
cat(strtrim(results[[1, "ImpactDetails"]], width = 200), "<truncated>")
cat(results[[1, "Institution"]])

## ------------------------------------------------------------------------
print(results[[1, "Country"]])
print(results[[1, "Institutions"]])
print(results[[1, "Institutions"]][,c("UKPRN", "InstitutionName")])

## ------------------------------------------------------------------------
results <- ref_get("SearchCaseStudies", query=list(ID=c(941, 942, 1014)))
print(results)

## ------------------------------------------------------------------------
results <- ref_get("SearchCaseStudies", query=list(UKPRN = 10007777))
dim(results)
results <- ref_get("SearchCaseStudies", query=list(UoA = 5))
dim(results)
results <- ref_get("SearchCaseStudies", query=list(tags = c(11280, 5085)))
dim(results)
results <- ref_get("SearchCaseStudies", query=list(phrase = "hello"))
dim(results)
results <- ref_get("SearchCaseStudies", query=list(UKPRN = 10007146,
                                                   UoA   = 3))
dim(results)

## ------------------------------------------------------------------------
institutions <- ref_get("ListInstitutions")
print(institutions)

## ------------------------------------------------------------------------
tag_types <- ref_get("ListTagTypes")
print(tag_types)

## ------------------------------------------------------------------------
tag_values_5 <- ref_get("ListTagValues", tag_type = 5)
print(tag_values_5)

## ------------------------------------------------------------------------
print(ref_tags)

## ------------------------------------------------------------------------
UoAs <- ref_get("ListUnitsOfAssessment")
print(UoAs)

## ---- eval = F-----------------------------------------------------------
#  uoa_table <- ref_get("ListUnitsOfAssessment")
#  uoa_list <- uoa_table$ID
#  
#  ref_corpus <- vector(length = length(uoa_list), mode = "list")
#  
#  for (i in seq_along(uoa_list)) {
#    message("Retrieving data for UoA ", uoa_list[i])
#    ref_corpus[[i]] <- ref_get("SearchCaseStudies", query = list(UoA = uoa_list[i]))
#  }
#  
#  output <- do.call(rbind, ref_corpus)

