library(stablelearner)


### Name: summary.stablelearnerList
### Title: Summarize Results from Stability Assessment
### Aliases: summary.stablelearner summary.stablelearnerList
###   print.summary.stablelearnerList
### Keywords: resampling, similarity

### ** Examples


## No test: 

library("partykit")

rval <- ctree(Species ~ ., data = iris)
stab <- stability(rval)

summary(stab)
summary(stab, reverse = FALSE)
summary(stab, probs = c(0.25, 0.5, 0.75))
summary(stab, names = "conditional inference tree")

## End(No test)




