library(revealedPrefs)


### Name: checkGarp
### Title: Non-parametric tests of rationality axioms (WARP, SARP, GARP).
### Aliases: checkGarp checkWarp checkSarp print.axiomTest
###   summary.axiomTest
### Keywords: methods

### ** Examples

# Check axioms for GARP-violating data:
data(noGarp)
summary(checkGarp(noGarp$x, noGarp$p))

# Check axioms for SARP-consistent data:
data(okSarp)
summary(checkSarp(okSarp$x, okSarp$p))



