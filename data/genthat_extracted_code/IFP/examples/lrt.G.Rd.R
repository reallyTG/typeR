library(IFP)


### Name: lrtG
### Title: Likelihood Ratio Tests for Identifying Disease Polymorphisms
###   with Same Effects
### Aliases: lrtG

### ** Examples

## LRT tests for a dominant variant (15th variant)
## the odds ratio: 3, control: 100, case: 100.

data(apoeG)
lrtG(1,genoT[,1:20],genoC[,1:20])

# use "lrtG(1,genoT,genoC)" for the actual test.




