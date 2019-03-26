library(mclust)


### Name: randomPairs
### Title: Random hierarchical structure
### Aliases: randomPairs
### Keywords: cluster

### ** Examples

data <- iris[,1:4]
randPairs <- randomPairs(data)
str(randPairs)
# start model-based clustering from a random partition
mod <- Mclust(data, initialization = list(hcPairs = randPairs))
summary(mod)



