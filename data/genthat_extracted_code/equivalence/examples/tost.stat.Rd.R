library(equivalence)


### Name: tost.stat
### Title: Computes a TOST for equivalence from sample statistics
### Aliases: tost.stat
### Keywords: htest

### ** Examples

data(ufc)
tost.stat(mean(ufc$Height.m.p - ufc$Height.m, na.rm=TRUE),
  sd(ufc$Height.m.p - ufc$Height.m, na.rm=TRUE),
  sum(!is.na(ufc$Height.m.p - ufc$Height.m)))





