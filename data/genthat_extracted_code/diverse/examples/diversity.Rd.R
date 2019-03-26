library(diverse)


### Name: diversity
### Title: *Main* function to compute diversity measures
### Aliases: diversity

### ** Examples

data(pantheon)
diversity(pantheon)
diversity(pantheon, type='variety')
diversity(geese, type='berger-parker', category_row=TRUE)
#reading csv data matrix
path_to_file <- system.file("extdata", "PantheonMatrix.csv", package = "diverse")
X <- read_data(path = path_to_file)
diversity(data=X, type="gini")
diversity(data=X, type="rao-stirling", method="cosine")
diversity(data=X, type="all", method="jaccard")

#reading csv dataframe
path_to_file <- system.file("extdata", "PantheonEdges.csv", package = "diverse")
X <- read_data(path = path_to_file)
#hill numbers
diversity(data=X, type="td", q=1)
#rao stirling with differente arguments
diversity(data=X, type="rao-stirling", method="euclidean", alpha=0, beta=1)
#more than one diversity measure
diversity(data=X, type=c('e','ev','bp','s'))



