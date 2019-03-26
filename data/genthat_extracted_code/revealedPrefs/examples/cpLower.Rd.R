library(revealedPrefs)


### Name: cpLower
### Title: Lower bound on the number of GARP-consistent subpopulations.
### Aliases: cpLower print.lowerBound summary.lowerBound
### Keywords: methods

### ** Examples

# Lower bound for GARP-violating data:
data(noGarp)
cp.low <- cpLower(noGarp$x, noGarp$p)
cp.low
cp.low$violators



