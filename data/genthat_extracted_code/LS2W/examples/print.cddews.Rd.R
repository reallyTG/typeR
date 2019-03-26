library(LS2W)


### Name: print.cddews
### Title: Print out information about a cddews object in readable form.
### Aliases: print.cddews
### Keywords: models

### ** Examples

#
# Generate a cddews object for a HaarMontage realisation 
#
monty <- HaarMontage(direction="diagonal")
tmp <- cddews(monty, filter.number=1, family="DaubExPhase", switch="direction",correct=FALSE)
#
# Now get R to use print.cddews
#
tmp



