library(taRifx)


### Name: splitc
### Title: Split data over columns
### Aliases: splitc splitc-package
### Keywords: manip

### ** Examples

my.list <- list(a = runif(5), b = runif(5), c = runif(5), d = runif(5), e = runif(10),
		f = runif(10), g = runif(10), h = runif(10), i = runif(10), j = runif(10))
my.df <- as.data.frame(my.list)
my.matrix <- as.matrix(my.df)

ind <- factor(c(1,1,1,1, 2,3, 4,4,4,4))
ind2 <- factor(c(1,1,1,1, 2,3, 4,4,4,4), levels = 1:5)

# Applies mean to each, you must use \code{colMeans},
#   as \code{mean} is deprecated for \code{data.frame}s
splitc(X = my.df, INDEX = ind, FUN = colMeans)
splitc(X = my.matrix, INDEX = ind2) # level 5 empty because not populated
splitc(X = my.list, INDEX = ind, FUN = sum) # applied to elements INDEX-wise



