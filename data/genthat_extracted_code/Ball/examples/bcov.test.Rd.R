library(Ball)


### Name: bcov.test
### Title: Ball Covariance Test
### Aliases: bcov.test bcov.test.default bcov.test.formula

### ** Examples

set.seed(1)

################# Quick Start #################
error <- runif(50, min = -0.3, max = 0.3)
x <- runif(50, 0, 4*pi)
y <- cos(x) + error
# plot(x, y)
bcov.test(x, y)

################# Quick Start #################
x <- matrix(runif(50 * 2, -pi, pi), nrow = 50, ncol = 2)
error <- runif(50, min = -0.3, max = 0.3)
y <- (sin((x[,1])^2 + x[,2])) + error
bcov.test(x = x, y = y)

################# Ball Covariance Test for Non-Hilbert Data #################
# load data:
data("ArcticLake")
# Distance matrix between y:
Dy <- nhdist(ArcticLake[["x"]], method = "compositional")
# Distance matrix between x:
Dx <- dist(ArcticLake[["depth"]])
# hypothesis test with BCov:
bcov.test(x = Dx, y = Dy, distance = TRUE)

################  Weighted Ball Covariance Test  #################
data("ArcticLake")
Dy <- nhdist(ArcticLake[["x"]], method = "compositional")
Dx <- dist(ArcticLake[["depth"]])
# hypothesis test with weighted BCov:
bcov.test(x = Dx, y = Dy, distance = TRUE, weight = TRUE)

################# Mutual Independence Test #################
x <- rnorm(30)
y <- (x > 0) * x + rnorm(30)
z <- (x <= 0) * x + rnorm(30)
data_list <- list(x, y, z)
bcov.test(data_list)

################# Mutual Independence Test for Meteorology data #################
data("meteorology")
bcov.test(meteorology)

################  Formula interface  ################
## independence test:
bcov.test(~ CONT + INTG, data = USJudgeRatings)
## mutual independence test:
bcov.test(~ CONT + INTG + DMNR, data = USJudgeRatings)



