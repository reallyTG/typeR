library(multicon)


### Name: scoreTest
### Title: Scoring Multiple Tests, Scales, or Composites
### Aliases: scoreTest
### Keywords: item scoring composite

### ** Examples

data(bfi)
keys.list <- list("agree"=c(-1,2,3,4,5),
  "conscientious"=c(6,7,8,-9,-10),"extraversion"=c(-11,-12,13,14,15),
  "neuroticism"=c(16,17,18,19,20),"openness"=c(21,-22,23,24,-25))
out <- scoreTest(bfi, keys.list, nomiss=0, maxScore=6, minScore=1)
outZ <- scoreTest(bfi, keys.list, Zitems=TRUE, nomiss=0)
describe(out) # Descriptives of Scale Scores
describe(outZ)
outR <- scoreTest(bfi, keys.list, nomiss=0, rel=TRUE, maxScore=6)
outR$rel # Scale reliabilities



