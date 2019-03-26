library(rClinicalCodes)


### Name: get_ClinicalCodes
### Title: Downloads clinical codes file from ClinicalCodes.org
### Aliases: get_ClinicalCodes

### ** Examples

## Not run: 
##D # Get codelist from url:
##D angina_codes <- get_ClinicalCodes(
##D url = "https://clinicalcodes.rss.mhs.man.ac.uk/medcodes/article/6/codelist/angina/download/")
##D head(angina_codes)
##D # get codelist by id and name
##D depression_codes <- get_ClinicalCodes(article_id = 6, codelist_name = "depression")
##D head(depression_codes)
##D # Get all code lists for an article
##D codelists <- get_ClinicalCodes(article_id = 2)
##D sapply(codelists, nrow)
## End(Not run)



