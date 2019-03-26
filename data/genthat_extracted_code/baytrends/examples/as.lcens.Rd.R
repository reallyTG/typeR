library(baytrends)


### Name: as.lcens
### Title: Left-censored Data Conversion
### Aliases: as.lcens as.lcens,lcens,missing,missing-method
###   as.lcens,numeric,missing,missing-method
###   as.lcens,numeric,numeric,missing-method
###   as.lcens,numeric,numeric,logical-method
###   as.lcens,numeric,numeric,character-method
###   as.lcens,numeric,missing,logical-method
###   as.lcens,numeric,missing,character-method
###   as.lcens,qw,missing,missing-method as.lcens,qw,numeric,missing-method
###   as.lcens,character,missing,missing-method
### Keywords: internal manip methods

### ** Examples


## The first value is censored at 2
as.lcens(c(1,3), 2)
## Set the first value to censored at that level and the detection limit is
# carried forward
as.lcens(c(1,3), censor.codes=c("<", ""))
# For combined remark and values:
as.lcens(c("<1", "1", "<1", "1", "2"))




