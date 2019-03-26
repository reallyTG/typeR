library(mosaic)


### Name: confint.htest
### Title: Extract summary statistics
### Aliases: confint.htest pval pval.htest stat stat.htest stat.uneval
### Keywords: inference stats

### ** Examples

confint(t.test(rnorm(100)))
pval(t.test(rnorm(100)))
stat(t.test(rnorm(100)))
confint(var.test(rnorm(10,sd=1), rnorm(20, sd=2)))
pval(var.test(rnorm(10,sd=1), rnorm(20, sd=2)))
if (require(mosaicData)) {
data(HELPrct)
stat(t.test (age ~ shuffle(sex), data=HELPrct))
# Compare to test statistic computed with permuted values of sex.
do(10) * stat(t.test (age ~ shuffle(sex), data=HELPrct))
}



