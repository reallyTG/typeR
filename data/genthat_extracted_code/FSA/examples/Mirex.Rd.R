library(FSA)


### Name: Mirex
### Title: Mirex concentration, weight, capture year, and species of Lake
###   Ontario salmon.
### Aliases: Mirex
### Keywords: datasets

### ** Examples

Mirex$year <- factor(Mirex$year)
lm1 <- lm(mirex~weight*year*species,data=Mirex)
anova(lm1)




