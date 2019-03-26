library(c212)


### Name: c212.ssBH
### Title: Implementation of Subset Benjamini-Hochberg for False Discover
###   Rate control
### Aliases: c212.ssBH
### Keywords: c212.ssBH ssBH Subset Benjamini-Hochberg

### ** Examples

trial.data <- data.frame(B = c(1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4),
j = c(1, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5),
AE = c("AE1", "AE2", "AE3", "AE4", "AE5", "AE6", "AE7", "AE8", "AE9", "AE10", "AE11",
"AE12", "AE13", "AE14", "AE15", "AE16", "AE17"),
p = c(0.135005, 0.010000, 0.001000, 0.005000, 0.153501, 0.020000, 0.0013, 0.0023,
0.011, 0.023000, 0.016, 0.0109, 0.559111, 0.751986, 0.308339, 0.837154, 0.325882))

c212.ssBH(trial.data, alpha=0.05)

## Not run: 
##D   B j   AE      p
##D 1 2 2  AE3 0.0010
##D 2 2 3  AE4 0.0050
##D 3 3 2  AE7 0.0013
##D 4 3 3  AE8 0.0023
##D 5 3 7 AE12 0.0109
##D 6 3 4  AE9 0.0110
## End(Not run)



