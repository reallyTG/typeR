library(h2o)


### Name: h2o.ddply
### Title: Split H2O Dataset, Apply Function, and Return Results
### Aliases: h2o.ddply

### ** Examples

## No test: 
library(h2o)
h2o.init()

# Import iris dataset to H2O
iris_hf <- as.h2o(iris)
# Add function taking mean of Sepal.Length column
fun <- function(df) { sum(df[, 1], na.rm = TRUE) / nrow(df) }
# Apply function to groups by flower specie
# uses h2o's ddply, since iris_hf is an H2OFrame object
res <- h2o.ddply(iris_hf, "Species", fun)
head(res)
## End(No test)



