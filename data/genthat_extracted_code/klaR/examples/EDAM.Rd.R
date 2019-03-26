library(klaR)


### Name: EDAM
### Title: Computation of an Eight Direction Arranged Map
### Aliases: EDAM
### Keywords: multivariate

### ** Examples

# Compute an Eight Directions Arranged Map for a random sample 
# of the iris data.
data(iris)
set.seed(1234)
iris.sample <- sample(150, 42)
irisEDAM <- EDAM(iris[iris.sample, 1:4], classes = iris[iris.sample, 5], 
    standardize = TRUE, iter.max = 3)
plot(irisEDAM, vertices = FALSE)
legend(3, 5, col = rainbow(3), legend = levels(iris[,5]), pch = 16)
print(irisEDAM)

# Construct clusters within the phases of the german business data 
# and visualize the centroids by EDAM.
data(B3)
phasemat <- lapply(1:4, function(x) B3[B3[,1] == x, 2:14])
subclasses <- lapply(phasemat, 
    function(x) cutree(hclust(dist(x)), k = round(nrow(x) / 4.47)))
centroids <- lapply(1:4, 
    function(y) apply(phasemat[[y]], 2, 
        function(x) by(x, subclasses[[y]], mean)))
centmat <- matrix(unlist(sapply(centroids, t)), ncol = 13, 
    byrow = TRUE, dimnames = list(NULL, colnames(centroids[[1]])))
centclasses <- unlist(lapply(1:4, 
    function(x) rep(x, unlist(lapply(centroids, nrow))[x])))
B3EDAM <- EDAM(centmat, classes = centclasses, standardize = TRUE, 
    iter.max = 6, rand = FALSE)
plot(B3EDAM, standardize = TRUE)
opar <- par(xpd = NA)
legend(4, 5.1, col = rainbow(4), pch = 16, xjust = 0.5, yjust = 0,
    ncol = 2, legend = c("upswing", "upper turning point", 
                         "downswing", "lower turning point"))
print(B3EDAM)
par(opar)



