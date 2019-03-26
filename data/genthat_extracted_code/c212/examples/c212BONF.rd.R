library(c212)


### Name: c212.BONF
### Title: Implementation of Bonferroni correction for error control
### Aliases: c212.BONF
### Keywords: c212.BONF Bonferroni Familywise error rate FWER

### ** Examples

trial.data <- data.frame(B = c(1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4),
j = c(1, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5),
AE = c("AE1", "AE2", "AE3", "AE4", "AE5", "AE6", "AE7", "AE8", "AE9", "AE10", "AE11",
"AE12", "AE13", "AE14", "AE15", "AE16", "AE17"),
p = c(0.135005, 0.010000, 0.001000, 0.005000, 0.153501, 0.020000, 0.0013, 0.0023, 0.011,
0.023000, 0.016, 0.0109, 0.559111, 0.751986, 0.308339, 0.837154, 0.325882))


c212.BONF(trial.data, 0.05)


## Not run: 
##D   B j  AE      p
##D 1 2 2 AE3 0.0010
##D 2 3 2 AE7 0.0013
##D 3 3 3 AE8 0.0023
## End(Not run)



