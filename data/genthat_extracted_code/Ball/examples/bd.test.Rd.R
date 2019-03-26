library(Ball)


### Name: bd.test
### Title: Ball Divergence based Equality of Distributions Test
### Aliases: bd.test bd.test.default bd.test.formula

### ** Examples

################# Quick Start #################
x <- rnorm(50)
y <- rnorm(50, mean = 1)
# plot(density(x))
# lines(density(y), col = "red")
# ball divergence:
bd.test(x = x, y = y)

################# Quick Start #################
x <- matrix(rnorm(100), nrow = 50, ncol = 2)
y <- matrix(rnorm(100, mean = 3), nrow = 50, ncol = 2)
# Hypothesis test with Standard Ball Divergence:
bd.test(x = x, y = y)

################# Simlated Non-Hilbert data #################
data("bdvmf")
## Not run: 
##D library(scatterplot3d)
##D scatterplot3d(bdvmf[["x"]], color = bdvmf[["group"]], 
##D               xlab = "X1", ylab = "X2", zlab = "X3")
## End(Not run)
# calculate geodesic distance between sample:
Dmat <- nhdist(bdvmf[["x"]], method = "geodesic")
# hypothesis test with BD :
bd.test(x = Dmat, size = c(150, 150), num.permutations = 99, distance = TRUE)

################# Non-Hilbert Real Data #################
# load data:
data("macaques")
# number of femala and male Macaca fascicularis:
table(macaques[["group"]])
# calculate Riemannian shape distance matrix:
Dmat <- nhdist(macaques[["x"]], method = "riemann")
# hypothesis test with BD:
bd.test(x = Dmat, num.permutations = 99, size = c(9, 9), distance = TRUE)

################  K-sample Test  #################
n <- 150
bd.test(rnorm(n), size = c(40, 50, 60))
# alternative input method:
x <- lapply(c(40, 50, 60), rnorm)
bd.test(x)

################  Formula interface  ################
## Two-sample test
bd.test(extra ~ group, data = sleep)
## K-sample test
bd.test(Sepal.Width ~ Species, data = iris)



