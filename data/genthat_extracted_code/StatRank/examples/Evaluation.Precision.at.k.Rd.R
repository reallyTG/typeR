library(StatRank)


### Name: Evaluation.Precision.at.k
### Title: Calculates the Average Precision at k
### Aliases: Evaluation.Precision.at.k

### ** Examples

EstimatedRank <- scramble(1:10)
RelevanceLevel <- runif(10)
Evaluation.Precision.at.k(EstimatedRank, RelevanceLevel, 5)



