library(island)


### Name: weight_of_evidence
### Title: Weight of evidence
### Aliases: weight_of_evidence

### ** Examples

models <- c("Best_3k", "Best_4k", "Best_5k", "Best_6k", "Best_7k",
  "Best_8k", "Best_9k")

  aks <- c(2977.852, 2968.568, 2957.384, 2952.618,
  2949.128, 2947.038, 2943.480)

  weight_of_evidence(cbind(models, aks))




