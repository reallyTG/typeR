library(fedregs)


### Name: cfr_urls
### Title: URLs for .xml Code of Federal Regulations.
### Aliases: cfr_urls

### ** Examples

## No test: 
library(dplyr)
url_list <- expand.grid(years = 2015:2017,
  title = 50,
  KEEP.OUT.ATTRS = FALSE,
  stringsAsFactors = FALSE) %>%
  mutate(url = purrr::map2(years, title, cfr_urls, check_url = TRUE))
  head(url_list)
## End(No test)





