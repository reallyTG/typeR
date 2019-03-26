library(FeatureHashing)


### Name: hash.size
### Title: Compute minimum hash size to reduce collision rate
### Aliases: hash.size

### ** Examples

data(ipinyou)

#First try with a size of 2^10
mat1 <- hashed.model.matrix(~., ipinyou.train, 2^10, create.mapping = TRUE)

#Extract mapping
mapping1 <- hash.mapping(mat1)
#Rate of collision
mean(duplicated(mapping1))

#Second try, the size is computed
size <- hash.size(ipinyou.train)
mat2 <- hashed.model.matrix(~., ipinyou.train, size, create.mapping = TRUE)

#Extract mapping
mapping2 <- hash.mapping(mat2)
#Rate of collision
mean(duplicated(mapping2))



