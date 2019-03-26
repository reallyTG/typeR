library(CVST)


### Name: constructSequentialTest
### Title: Construct and Handle Sequential Tests.
### Aliases: constructSequentialTest getCVSTTest testSequence plotSequence

### ** Examples

st = getCVSTTest(10)
s = rbinom(10,1, .5)
plotSequence(st, s)
testSequence(st, s)



