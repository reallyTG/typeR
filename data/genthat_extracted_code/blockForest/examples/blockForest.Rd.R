library(blockForest)


### Name: blockForest
### Title: blockForest
### Aliases: blockForest

### ** Examples

require(blockForest)

# Standard Block Forest
blockForest(Species ~ ., iris, 
            blocks = list(1:2, 3:4), 
            mtry = c(1, 2), 
            block.weights = c(0.1, 0.9), 
            block.method = "BlockForest")

# Without blocks, grow standard random forest
blockForest(Species ~ ., iris)




