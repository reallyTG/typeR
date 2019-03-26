library(SmCCNet)


### Name: getRobustPseudoWeights
### Title: Calculate the canonical correlation weights based on sparse
###   multiple canonical correlation analysis (SmCCA), sparse supervised
###   canonical correlation analysis (SsCCA), or sparse canonical
###   correlation analysis (SCCA).
### Aliases: getRobustPseudoWeights

### ** Examples


## For illustration, we only subsample 5 times.
set.seed(123)

# Unweighted SmCCA
W1 <- getRobustPseudoWeights(geneExpr, mirnaExpr, Trait = pheno, Lambda1 = 0.05,
  Lambda2 = 0.05, s1 = 0.7, s2 = 0.9, NoTrait = FALSE, FilterByTrait = FALSE,
  SubsamplingNum = 5, CCcoef = NULL, trace = FALSE)
  
# Weighted SmCCA
W2 <- getRobustPseudoWeights(geneExpr, mirnaExpr, Trait = pheno, Lambda1 = 0.05,
  Lambda2 = 0.05, s1 = 0.7, s2 = 0.9, NoTrait = FALSE, FilterByTrait = FALSE,
  SubsamplingNum = 5, CCcoef = c(1, 5, 5), trace = FALSE)
  
# SsCCA
W3 <- getRobustPseudoWeights(geneExpr, mirnaExpr, Trait = pheno, Lambda1 = .05, Lambda2 = 0.5,
  s1 = 0.7, s2 = 0.9, NoTrait = FALSE, FilterByTrait = TRUE,
  SubsamplingNum = 5, CCcoef = NULL, trace = FALSE)

# SCCA
W4 <- getRobustPseudoWeights(geneExpr, mirnaExpr, Trait = NULL, Lambda1 = 0.05,
  Lambda2 = 0.05, s1 = 0.7, s2 = 0.9, NoTrait = TRUE, 
  SubsamplingNum = 5, CCcoef = NULL, trace = FALSE)
  




