library(DescTools)


### Name: BinomCI
### Title: Confidence Intervals for Binomial Proportions
### Aliases: BinomCI
### Keywords: univar

### ** Examples

BinomCI(x=37, n=43, method=c("wald", "wilson", "agresti-coull", "jeffreys",
  "modified wilson", "modified jeffreys", "clopper-pearson", "arcsine", "logit",
  "witting", "pratt")
)


# the confidence interval computed by binom.test
#   corresponds to the Clopper-Pearson interval
BinomCI(x=42, n=43, method="clopper-pearson")
binom.test(x=42, n=43)$conf.int


# all arguments are being recycled:
BinomCI(x=c(42, 35, 23, 22), n=43, method="wilson")
BinomCI(x=c(42, 35, 23, 22), n=c(50, 60, 70, 80), method="jeffreys")



