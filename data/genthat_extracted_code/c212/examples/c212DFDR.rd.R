library(c212)


### Name: c212.DFDR
### Title: Implementation of the Double False Discovery Rate for
###   controlling the False Discovery Rate.
### Aliases: c212.DFDR
### Keywords: c212.DFDR DFDR Double False Discovery Rate

### ** Examples

trial.data <- data.frame(B = c(1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4),
AE = c("AE1", "AE2", "AE3", "AE4", "AE5", "AE6", "AE7", "AE8", "AE9", "AE10", "AE11",
"AE12", "AE13", "AE14", "AE15", "AE16", "AE17"),
p = c(0.135005, 0.010000, 0.001000, 0.005000, 0.153501, 0.020000, 0.0013, 0.0023,
0.011, 0.023000, 0.016, 0.0109, 0.559111, 0.751986, 0.308339, 0.837154, 0.325882))


c212.DFDR(trial.data, 0.05)


## Not run: 
##D    B j   AE      p
##D 1  2 2  AE3 0.0010
##D 2  3 2  AE7 0.0013
##D 3  3 3  AE8 0.0023
##D 4  2 3  AE4 0.0050
##D 5  2 1  AE2 0.0100
##D 6  3 7 AE12 0.0109
##D 7  3 4  AE9 0.0110
##D 8  3 6 AE11 0.0160
##D 9  3 1  AE6 0.0200
##D 10 3 5 AE10 0.0230
## End(Not run)



