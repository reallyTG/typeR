library(rfishbase)


### Name: list_fields
### Title: list_fields
### Aliases: list_fields

### ** Examples

## No test: 
list_fields("Temp")

## Regex matching on full table
library(dplyr)
list_fields() %>% filter(grepl("length", columns, ignore.case = TRUE))
## End(No test)



