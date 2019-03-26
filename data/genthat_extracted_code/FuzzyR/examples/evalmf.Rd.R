library(FuzzyR)


### Name: evalmf
### Title: Evaluate fuzzy membership function
### Aliases: evalmf

### ** Examples

evalmf(5, mf.type=gbellmf, mf.params=c(1,2,3))
evalmf(1:10, mf.type=gbellmf, mf.params=c(1,2,3))

mf <- genmf('gbellmf', c(1,2,3))
evalmf(5, mf)
evalmf(1:10, mf)



