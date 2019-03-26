library(gofastr)


### Name: sub_in_na
### Title: Regex Sub to Missing
### Aliases: sub_in_na

### ** Examples

x <- c("45", "..", "", "   ", "dog")
sub_in_na(x)
sub_in_na(x, "^\\s*$")

## Not run: 
##D library(tidyverse)
##D x %>%
##D     q_dtm() %>%
##D     as.matrix()
##D 
##D x %>%
##D     sub_in_na() %>%
##D     q_dtm() %>%
##D     as.matrix()
## End(Not run)



