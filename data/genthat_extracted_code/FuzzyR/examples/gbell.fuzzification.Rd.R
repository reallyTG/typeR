library(FuzzyR)


### Name: gbell.fuzzification
### Title: Gaussian bell fuzzification
### Aliases: gbell.fuzzification

### ** Examples

mf <- gbell.fuzzification(3, c(1,2))
# This is the same as:
mf <- genmf('gbellmf', c(1,2,3))

evalmf(1:10, mf)



