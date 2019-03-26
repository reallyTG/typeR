library(stablelearner)


### Name: boxplot.stablelearnerList
### Title: Illustrate Results from Stability Assessment
### Aliases: boxplot.stablelearner boxplot.stablelearnerList
### Keywords: resampling, similarity

### ** Examples

## No test: 

library("partykit")
r1 <- ctree(Species ~ ., data = iris)

library("rpart")
r2 <- rpart(Species ~ ., data = iris)

stab <- stability(r1, r2, names = c("ctree", "rpart"))
boxplot(stab)

## End(No test)



