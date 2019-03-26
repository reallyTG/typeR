library(seriation)


### Name: seriate
### Title: Seriate Dissimilarity Matrices, Matrices or Arrays
### Aliases: seriate seriate.matrix seriate.dist seriate.array LS_insert
###   LS_swap LS_reverse LS_mixed
### Keywords: optimize cluster

### ** Examples

## show available seriation methods (for dist and matrix)
show_seriation_methods("dist")
show_seriation_methods("matrix")

##seriate dist
data("iris")
x <- as.matrix(iris[-5])
x <- x[sample(1:nrow(x)),]
d <- dist(x)

## default seriation
order <- seriate(d)
order

## plot
pimage(d, main = "Random")
pimage(d, order, main = "Reordered")

## compare quality
rbind(
        random = criterion(d),
        reordered = criterion(d, order)
     )

## seriate matrix
data("iris")
x <- as.matrix(iris[-5])

## to make the variables comparable, we scale the data
x <- scale(x, center = FALSE)

## try some methods
pimage(x, main = "original data")
criterion(x)

order <- seriate(x, method = "BEA_TSP")
pimage(x, order, main = "TSP to optimize ME")
criterion(x, order)

order <- seriate(x, method = "PCA")
pimage(x, order, main = "First principal component")
criterion(x, order)

## 2 TSPs
order <- c(
    seriate(dist(x), method = "TSP"),
    seriate(dist(t(x)), method = "TSP")
)
pimage(x, order, main = "2 TSPs")
criterion(x, order)



