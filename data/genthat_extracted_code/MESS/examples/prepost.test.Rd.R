library(MESS)


### Name: prepost.test
### Title: Pretest-posttest RCT for quantitative observations with possible
###   missing values
### Aliases: prepost.test
### Keywords: htest

### ** Examples

# From Altman
expo = c(rep(1,9),rep(0,7))
bp1w = c(137,120,141,137,140,144,134,123,142,139,134,136,151,147,137,149)
bp_base = c(147,129,158,164,134,155,151,141,153,133,129,152,161,154,141,156)
diff = bp1w-bp_base
prepost.test(bp_base, bp1w, expo)




