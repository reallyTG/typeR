library(wordspace)


### Name: DSM_Vectors
### Title: Pre-Compiled DSM Vectors for Selected Words (wordspace)
### Aliases: DSM_Vectors
### Keywords: datasets

### ** Examples


nearest.neighbours(DSM_Vectors, "walk_V", 25)

eval.similarity.correlation(RG65, DSM_Vectors) # fairly good

# post-hoc power scaling: whitening (correspond to power=0 in dsm.projection)
sigma <- attr(DSM_Vectors, "sigma")
M <- scaleMargins(DSM_Vectors, cols=1 / sigma)
eval.similarity.correlation(RG65, M) # very good




