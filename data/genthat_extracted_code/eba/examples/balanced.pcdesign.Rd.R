library(eba)


### Name: balanced.pcdesign
### Title: Balanced Paired-Comparison Design
### Aliases: balanced.pcdesign
### Keywords: models

### ** Examples

## Create balanced design for 6 stimuli
bp <- balanced.pcdesign(6)

## Replicate each within-pair order 10 times and re-randomize
cbind(replicate(10, sample(bp$listA)), replicate(10, sample(bp$listB)))



