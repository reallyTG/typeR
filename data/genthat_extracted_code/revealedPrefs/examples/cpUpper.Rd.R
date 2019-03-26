library(revealedPrefs)


### Name: cpUpper
### Title: Upper bound on the number of GARP-consistent subpopulations and
###   clustering.
### Aliases: cpUpper print.upperBound summary.upperBound
### Keywords: methods

### ** Examples

# Cluster GARP-violating data:
data(noGarp)
cp.up <- cpUpper(noGarp$x, noGarp$p)
cp.up$clustering



