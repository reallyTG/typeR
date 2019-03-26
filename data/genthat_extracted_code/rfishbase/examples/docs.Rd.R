library(rfishbase)


### Name: docs
### Title: docs
### Aliases: docs

### ** Examples

## No test: 
tables <- docs()
# Describe the fecundity table
dplyr::filter(tables, table == "fecundity")$description
## See fields in fecundity table
docs("fecundity")
## Note: only 
## End(No test)



