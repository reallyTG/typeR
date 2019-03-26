library(wordspace)


### Name: dsm.projection
### Title: Reduce Dimensionality of DSM by Subspace Projection (wordspace)
### Aliases: dsm.projection

### ** Examples


# 240 English nouns in space with correlated dimensions "own", "buy" and "sell"
M <- DSM_GoodsMatrix[, 1:3]

# SVD projection into 2 latent dimensions
S <- dsm.projection(M, 2, with.basis=TRUE)
  
100 * attr(S, "R2") # dim 1 captures 86.4% of distances
round(attr(S, "basis"), 3) # dim 1 = commodity, dim 2 = owning vs. buying/selling
  
S[c("time", "goods", "house"), ] # some latent coordinates
  
## Not run: 
##D idx <- DSM_GoodsMatrix[, 4] > .85 # only show nouns on "fringe"
##D plot(S[idx, ], pch=20, col="red", xlab="commodity", ylab="own vs. buy/sell")
##D text(S[idx, ], rownames(S)[idx], pos=3)
## End(Not run)



