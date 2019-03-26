library(rClinicalCodes)


### Name: codelist_keywords
### Title: Extract keywords from clinical code lists
### Aliases: codelist_keywords

### ** Examples

## Not run: 
##D # Get codelist from url:
##D angina_codes <- get_ClinicalCodes(
##D url = "https://clinicalcodes.rss.mhs.man.ac.uk/medcodes/article/6/codelist/angina/download/")
##D codelist_keywords(angina_codes, extra_stopwords = c("good", "poor", "[x]"))
## End(Not run)



