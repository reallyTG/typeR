library(futile.matrix)


### Name: futile.matrix-package
### Title: A collection of matrix manipulation functions
### Aliases: futile.matrix futile.matrix-package
### Keywords: attribute logic package

### ** Examples

# Generate a random ensemble
m <- rmatrix(WishartModel(100,400))

# Select sub-matrices
library(datasets)
select(swiss, "Rive")
select(swiss, col.pat='^E')
select(swiss, "Rive", '^E') <- -1
dimnames <- list( c(rownames(swiss), 'Zermat', 'Zurich', 'Geneva'),
 c(colnames(swiss), 'Age','Hair.Color') )
my.swiss <- expand(swiss, dimnames)



