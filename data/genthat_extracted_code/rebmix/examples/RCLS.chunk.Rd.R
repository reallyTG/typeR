library(rebmix)


### Name: chunk-methods
### Title: Extracts Chunk from Train and Test Datasets
### Aliases: chunk chunk-methods chunk,RCLS.chunk-method
###   show,RCLS.chunk-method
### Keywords: classification

### ** Examples

data("iris")

# Split dataset into train (75%) and test (25%) subsets.

set.seed(5)

Iris <- split(p = 0.75, Dataset = iris, class = 5)

# Extract chunk from train and test datasets.

Iris14 <- chunk(x = Iris, variables = c(1,4))

Iris14



