library(ecospat)


### Name: ecospat.SESAM.prr
### Title: SESAM Probability Ranking Rule
### Aliases: ecospat.SESAM.prr

### ** Examples

proba <- ecospat.testData[,73:92]
sr <- as.data.frame(rowSums(proba))
ecospat.SESAM.prr(proba, sr)




