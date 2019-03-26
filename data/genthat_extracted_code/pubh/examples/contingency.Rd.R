library(pubh)


### Name: contingency
### Title: Measures of association from two by two contingency tables
###   (formula).
### Aliases: contingency

### ** Examples

## A case-control study on the effect of alcohol on oesophageal cancer.
Freq <- c(386, 29, 389, 171)
status <- gl(2, 1, 4, labels=c("Control", "Case"))
alcohol <- gl(2, 2, labels=c("0-39", "40+"))
cancer <- data.frame(Freq, status, alcohol)
cancer <- expand_df(cancer)
contingency(status ~ alcohol, data = cancer, method = "case.control")



