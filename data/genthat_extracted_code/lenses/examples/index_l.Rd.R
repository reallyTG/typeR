library(lenses)


### Name: index_l
### Title: Construct a lens into an index/name
### Aliases: index_l index

### ** Examples

x <- 1:10
view(x, index_l(1))
set(x, index(5), 50)
head(view(iris, index(2)))



