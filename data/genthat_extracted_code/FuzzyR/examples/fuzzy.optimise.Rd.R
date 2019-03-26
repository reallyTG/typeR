library(FuzzyR)


### Name: fuzzy.optimise
### Title: Fuzzy optimisation
### Aliases: fuzzy.optimise

### ** Examples

mf <- genmf(gbellmf, c(1,2,3))
x <- seq(4, 5, by=0.01)
max(evalmf(x, mf))
fuzzy.optimise(mf, 4, 5)



