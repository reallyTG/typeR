library(LS2W)


### Name: cddews
### Title: Compute the local wavelet spectrum estimate
### Aliases: cddews
### Keywords: models

### ** Examples

# Apply the cddews estimate function to a HaarMontage realisation
#
monty <- HaarMontage(direction="diagonal")
monty.cddews <- cddews(monty, filter.number=1, family="DaubExPhase")
monty.cddews



