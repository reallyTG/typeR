library(lsa)


### Name: weightings
### Title: Weighting Schemes (Matrices)
### Aliases: lw_tf lw_logtf lw_bintf gw_normalisation gw_idf gw_gfidf
###   entropy gw_entropy
### Keywords: array

### ** Examples


## use the logarithmised term frequency as local weight and 
## the inverse document frequency as global weight.

vec1 = c( 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
vec2 = c( 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0 )
vec3 = c( 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0 )
matrix = cbind(vec1,vec2, vec3)
weighted = lw_logtf(matrix)*gw_idf(matrix)




