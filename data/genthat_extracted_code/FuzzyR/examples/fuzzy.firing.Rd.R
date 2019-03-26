library(FuzzyR)


### Name: fuzzy.firing
### Title: Fuzzy rule firing
### Aliases: fuzzy.firing

### ** Examples

x.mf <- x.fuzzification(gbell.fuzzification, 3, c(1,2))
ante.mf <- genmf(gbellmf, c(1,2,6))
firing.strength <- fuzzy.firing(min, x.mf, ante.mf, lower=0, upper=10)
firing.strength



