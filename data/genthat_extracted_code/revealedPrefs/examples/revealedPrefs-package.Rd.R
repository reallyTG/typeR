library(revealedPrefs)


### Name: revealedPrefs-package
### Title: Revealed Preferences and Microeconomic Rationality
### Aliases: revealedPrefs-package revealedPrefs
### Keywords: package

### ** Examples

# Compute preferences and check rationality on a GARP-violating dataset:
data(noGarp)
indirectPrefs(noGarp$x, noGarp$p)
checkGarp(noGarp$x, noGarp$p)

# Cluster dataset into GARP-consistent subpopulations:
cpUpper(noGarp$x, noGarp$p)



