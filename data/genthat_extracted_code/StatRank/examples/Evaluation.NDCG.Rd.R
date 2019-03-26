library(StatRank)


### Name: Evaluation.NDCG
### Title: Calculates the Normalized Discounted Cumluative Gain
### Aliases: Evaluation.NDCG

### ** Examples

EstimatedRank <- scramble(1:10)
RelevanceLevel <- runif(10)
Evaluation.NDCG(EstimatedRank, RelevanceLevel)



