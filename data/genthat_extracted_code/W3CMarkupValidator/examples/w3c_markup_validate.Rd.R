library(W3CMarkupValidator)


### Name: w3c_markup_validate
### Title: Validate Markup of Web Documents using W3C Markup Validation
###   Services
### Aliases: w3c_markup_validate

### ** Examples

## Not much to show with this as it should validate ok
## (provided that the validation service is accessible):
tryCatch(w3c_markup_validate(uri = "https://CRAN.R-project.org"),
         error = identity)



