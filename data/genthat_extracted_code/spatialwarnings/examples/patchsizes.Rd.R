library(spatialwarnings)


### Name: patchsizes
### Title: Get patch sizes.
### Aliases: patchsizes

### ** Examples


data(forestgap)
patchsizes(forestgap[[5]]) # Use a single matrix

# Compute the average patch size of each matrix
list_patches <- patchsizes(forestgap) # get the patch size for each matrix
print( sapply(list_patches, mean)) # print the average patch size 

# Example with 8-way neighborhood
nbmask8 <- matrix(c(1,1,1,
                    1,0,1,
                    1,1,1), ncol = 3)
patchsizes(forestgap[[5]], nbmask = nbmask8)





