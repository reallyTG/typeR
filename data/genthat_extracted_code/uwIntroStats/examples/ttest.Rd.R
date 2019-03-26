library(uwIntroStats)


### Name: ttest
### Title: T-test with Improved Layout
### Aliases: ttest ttest.do plot.ttest print.ttest ttest.default
### Keywords: ~kwd1 ~kwd2

### ** Examples

#- Read in data set -#
psa <- read.table("http://www.emersonstatistics.com/datasets/psa.txt", header=TRUE)
attach(psa)

#- Perform t-test -#
ttest(pretxpsa, null.hypoth = 100, test.type = "greater", more.digits = 1)

#- Define new binary variable as indicator -#
#- of whether or not bss was worst possible -#
bssworst <- bss
bssworst[bss == 1] <- 0
bssworst[bss == 2] <- 0
bssworst[bss == 3] <- 1

#- Perform t-test allowing for unequal -#
#- variances between strata -#
ttest(pretxpsa, by = bssworst)

#- Perform matched t-test -#
ttest(pretxpsa, nadirpsa, matched = TRUE, conf.level = 99/100, more.digits = 1)




