library(LAM)


### Name: suff_stat_NA_pattern
### Title: Sufficient Statistics for Dataset with Missing Response Pattern
### Aliases: suff_stat_NA_pattern

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example for computation of sufficient statistics
#############################################################################

library(STARTS)

data(data.starts01b, package="STARTS")
dat <- data.starts01b
dat1 <- dat[ , paste0("E",1:3)]

#-- compute sufficient statistics
res <- LAM::suff_stat_NA_pattern(dat1)
str(res)



