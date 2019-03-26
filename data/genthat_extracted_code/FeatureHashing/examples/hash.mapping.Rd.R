library(FeatureHashing)


### Name: hash.mapping
### Title: Extract mapping between hash and original values
### Aliases: hash.mapping

### ** Examples

data(ipinyou)

m <- hashed.model.matrix(~., ipinyou.train, 2^10, create.mapping = TRUE)
mapping <- hash.mapping(m)



