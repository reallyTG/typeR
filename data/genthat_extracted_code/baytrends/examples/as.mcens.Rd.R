library(baytrends)


### Name: as.mcens
### Title: Multiply-censored Data Conversion
### Aliases: as.mcens as.mcens,mcens,missing,missing-method
###   as.mcens,lcens,missing,missing-method
###   as.mcens,numeric,missing,missing-method
###   as.mcens,numeric,numeric,missing-method
###   as.mcens,numeric,missing,numeric-method
###   as.mcens,numeric,missing,integer-method
###   as.mcens,numeric,missing,character-method
###   as.mcens,qw,missing,missing-method
###   as.mcens,character,missing,missing-method
### Keywords: internal manip methods

### ** Examples

## Create one of each type of censoring, including uncensored
# the last value is missing
as.mcens(c(-Inf, 2, 2, 5, NA), c(1, 2, 3, Inf, NA))
# For combined remark and values:
as.mcens(c("<1", "1", ">3", "1", "2"))



