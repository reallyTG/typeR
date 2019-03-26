library(dendextend)


### Name: is_some_class
### Title: Is the object of some class
### Aliases: is_some_class is.hclust is.dendrogram is.phylo is.dendlist
###   is.dist

### ** Examples

# TRUE:
is.dendlist(dendlist())
# FALSE
is.dendlist(1)
# TRUE:
is.dist(dist(mtcars))
# FALSE
is.dist(mtcars)



