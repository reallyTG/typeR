library(revealedPrefs)


### Name: simGarp
### Title: Generate random data consistent with rationality axioms (WARP,
###   SARP, GARP).
### Aliases: simGarp simWarp simSarp

### ** Examples

# Generate 100 WARP-consistent observations of 5 goods
simdata <- simWarp(100, 5)
summary(checkWarp(simdata$x, simdata$p))
summary(checkGarp(simdata$x, simdata$p))



