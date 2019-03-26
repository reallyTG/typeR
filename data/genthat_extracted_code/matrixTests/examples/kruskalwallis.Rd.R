library(matrixTests)


### Name: kruskalwallis
### Title: Kruskal-Wallis Rank Sum Test
### Aliases: kruskalwallis row_kruskalwallis col_kruskalwallis

### ** Examples

col_kruskalwallis(iris[,1:4], iris$Species)
row_kruskalwallis(t(iris[,1:4]), iris$Species)




