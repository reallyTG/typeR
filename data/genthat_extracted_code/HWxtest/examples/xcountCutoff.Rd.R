library(HWxtest)


### Name: xcountCutoff
### Title: Determine immediately whether number of tables is over a limit
### Aliases: xcountCutoff

### ** Examples

#
alleles <- c(15, 14, 11, 12, 2, 2, 1, 3)
if(xcountCutoff(alleles)) cat("There are too many tables")



