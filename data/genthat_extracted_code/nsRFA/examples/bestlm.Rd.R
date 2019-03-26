library(nsRFA)


### Name: bestlm
### Title: Subsets regression
### Aliases: bestlm print.bestlm summary.bestlm
### Keywords: regression

### ** Examples

data(hydroSIMN)

bestlm(parameters[,"Dm"], parameters[,-c(1:2)])

regr <- lm(Dm ~ Am + S2000 + NORD, parameters); regr
summary(regr)



