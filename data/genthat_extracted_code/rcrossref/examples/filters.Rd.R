library(rcrossref)


### Name: filters
### Title: Get filter details and names.
### Aliases: filters filter_names filter_details

### ** Examples

filter_names()
filter_details()
filter_details()$has_authenticated_orcid
filter_details()$has_authenticated_orcid$possible_values
filter_details()$has_authenticated_orcid$description
filter_details("issn")
filter_details("iss")
filter_details(c("issn", "alternative_id"))



