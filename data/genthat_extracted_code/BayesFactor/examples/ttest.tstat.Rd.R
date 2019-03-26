library(BayesFactor)


### Name: ttest.tstat
### Title: Use t statistic to compute Bayes factor for one- and two- sample
###   designs
### Aliases: ttest.tstat
### Keywords: htest

### ** Examples

## Classical example: Student's sleep data
data(sleep)
plot(extra ~ group, data = sleep)

## t.test() gives a t value of -4.0621
t.test(extra ~ group, data = sleep, paired=TRUE)
## Gives a Bayes factor of about 15
## in favor of the alternative hypothesis
result <- ttest.tstat(t = -4.0621, n1 = 10)
exp(result[['bf']])



