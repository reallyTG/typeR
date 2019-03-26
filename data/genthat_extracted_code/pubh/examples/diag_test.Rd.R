library(pubh)


### Name: diag_test
### Title: Diagnostic tests from variables.
### Aliases: diag_test

### ** Examples

## We compare the use of lung’s X-rays on the screening of TB against the gold standard test.
Freq <- c(1739, 8, 51, 22)
BCG <- gl(2, 1, 4, labels=c("Negative", "Positive"))
Xray <- gl(2, 2, labels=c("Negative", "Positive"))
tb <- data.frame(Freq, BCG, Xray)
tb <- expand_df(tb)
diag_test(BCG ~ Xray, data=tb)



