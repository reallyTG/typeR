library(distrr)


### Name: extract_unique
### Title: Functions to be used in conjunction with 'dcc' family
### Aliases: extract_unique extract_unique2 extract_unique3 extract_unique4

### ** Examples

data("invented_wages")
tmp <- extract_unique(df = invented_wages[ , c("gender", "sector")])
tmp
str(tmp)



