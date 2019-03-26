library(recommenderlab)


### Name: MovieLense
### Title: MovieLense Dataset (100k)
### Aliases: MovieLense MovieLenseMeta
### Keywords: datasets

### ** Examples

data(MovieLense)
MovieLense

## look at the first few ratings of the first user
head(as(MovieLense[1,], "list")[[1]])


## visualize part of the matrix
image(MovieLense[1:100,1:100])

## number of ratings per user
hist(rowCounts(MovieLense))

## number of ratings per movie
hist(colCounts(MovieLense))

## mean rating (averaged over users)
mean(rowMeans(MovieLense))

## available movie meta information
head(MovieLenseMeta)



