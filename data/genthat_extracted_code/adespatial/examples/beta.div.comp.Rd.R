library(adespatial)


### Name: beta.div.comp
### Title: Decompose D in replacement and richness difference components
### Aliases: beta.div.comp

### ** Examples


if(require(ade4, quietly = TRUE)){
data(doubs)
fish.sp = doubs$fish[-8,]   # Fish data; site 8 is removed because no fish were caught

# Compute and partition a matrix of Jaccard indices (presence-absence data)
out1 = beta.div.comp(fish.sp, coef="J", quant=FALSE)
out1$part

# Compute and partition a matrix of percentage difference indices
# (quantitative form of Sorensen index)
out2 = beta.div.comp(fish.sp, coef="S", quant=TRUE)
out2$part
# In paragraph Value, see the description of the 5 elements of vector part. 
# Is the fish beta diversity dominated by replacement or richness/abundance difference?
}




