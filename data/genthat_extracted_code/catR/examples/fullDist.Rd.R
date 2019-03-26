library(catR)


### Name: fullDist
### Title: Full distribution of ability estimator (dichotomous models only)
### Aliases: fullDist

### ** Examples


## Dichotomous models ##

 # Generation of ten items under 1PL model
 it <- genDichoMatrix(10, model = "1PL")
 
 # Full distribution of ML estimator for ability level zero
 fullDist(0, it, method = "ML")

 # Idem with BM estimator (probabilities don't change, only estimated abilities)
 fullDist(0, it, method = "BM")

 # Idem with ability level 1 (only probabilities change)
 fullDist(1, it, method = "BM")

 # Distributions with two ability levels 1 and 0.5
 fullDist(c(1, 0.5), it, method = "BM")

 # Generation of ten items under 2PL model
 it2 <- genDichoMatrix(10, model = "2PL")
 
 # Full distribution of ML estimator for ability level zero
 fullDist(0, it2, method = "ML")
 


