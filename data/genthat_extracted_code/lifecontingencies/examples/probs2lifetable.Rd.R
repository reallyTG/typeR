library(lifecontingencies)


### Name: probs2lifetable
### Title: Life table from probabilities
### Aliases: probs2lifetable

### ** Examples

fakeSurvivalProbs=seq(0.9,0,by=-0.1)
newTable=probs2lifetable(fakeSurvivalProbs,type="px",name="fake")
head(newTable)
tail(newTable)



