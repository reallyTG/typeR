library(FuzzyR)


### Name: x.fuzzification
### Title: Fuzzification
### Aliases: x.fuzzification

### ** Examples

x <- 3
mf <- x.fuzzification(gbell.fuzzification, x, c(1,2))
# This is the same as:
mf <- genmf(gbellmf, c(1,2,x))

evalmf(1:10, mf)



