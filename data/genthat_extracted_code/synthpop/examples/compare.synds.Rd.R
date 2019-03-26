library(synthpop)


### Name: compare.synds
### Title: Compare univariate distributions of synthesised and observed
###   data
### Aliases: compare.synds print.compare.synds

### ** Examples

ods <- SD2011[ , c("sex","age","edu","marital","ls","income")]
s1  <- syn(ods)
compare(s1, ods, vars = "ls")
compare(s1, ods, vars = "income", stat = "counts", breaks = 10)



