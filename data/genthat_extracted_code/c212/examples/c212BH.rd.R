library(c212)


### Name: c212.BH
### Title: Implementation of Benjamini-Hochberg procedure for False
###   Discovery Rate control
### Aliases: c212.BH
### Keywords: BH Benjamini-Hochberg c212.BH

### ** Examples


## Not run: 
##D File: trial.dat
##D ====
##D B j AE p
##D 1 1 AE1 0.135005
##D 2 1 AE2 0.010000
##D 2 2 AE3 0.001000
##D 2 3 AE4 0.005000
##D 2 4 AE5 0.153501
##D 3 1 AE6 0.020000
##D 3 2 AE7 0.001300
##D 3 3 AE8 0.002300
##D 3 4 AE9 0.011000
##D 3 5 AE10 0.023000
##D 3 6 AE11 0.016000
##D 3 7 AE12 0.010900
##D 4 1 AE13 0.559111
##D 4 2 AE14 0.751986
##D 4 3 AE15 0.308339
##D 4 4 AE16 0.837154
##D 4 5 AE17 0.325882
##D 
##D c212.BH("trial.dat", alpha = 0.05)
##D 
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


trial.data <- data.frame(B = c(1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4),
j = c(1, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5),
AE = c("AE1", "AE2", "AE3", "AE4", "AE5", "AE6", "AE7", "AE8", "AE9", "AE10", "AE11",
"AE12", "AE13", "AE14", "AE15", "AE16", "AE17"),
p = c(0.135005, 0.010000, 0.001000, 0.005000, 0.153501, 0.020000, 0.0013, 0.0023,
0.011, 0.023000, 0.016, 0.0109, 0.559111, 0.751986, 0.308339, 0.837154, 0.325882))


c212.BH(trial.data, 0.05)


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




