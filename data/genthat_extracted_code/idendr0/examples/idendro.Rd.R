library(idendr0)


### Name: idendro
### Title: Interactive Dendrogram
### Aliases: idendro

### ** Examples

if (interactive()) {
    data(iris, envir = environment())
    hc <- hclust(dist(iris[, 1:4]))
    idendro(hc, iris)
}
# see demos for more examples



