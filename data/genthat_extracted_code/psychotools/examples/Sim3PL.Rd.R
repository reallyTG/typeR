library(psychotools)


### Name: Sim3PL
### Title: Simulated Data for fitting a 3PL and 3PLu
### Aliases: Sim3PL
### Keywords: datasets

### ** Examples

## overview
data("Sim3PL", package = "psychotools")
str(Sim3PL)

## data generation
M <- 10000
N <- 10

## 3PL scenario
set.seed(277)
theta <- rnorm(M, 0, 1)
a <- rlnorm(N, 0, 0.25)
b <- rnorm(N, 0, 1)
g <- runif(N, 0.1, 0.2)
u <- rep(1, N)
probs <- matrix(g, M, N, byrow = TRUE) + matrix(u - g, M, N, byrow = TRUE) *
  plogis(matrix(a, M, N, byrow = TRUE) * outer(theta, b, "-"))
resp <- (probs > matrix(runif(M * N, 0, 1), M, N)) + 0
all.equal(resp, Sim3PL$resp, check.attributes = FALSE)

## 3PLu scenario
set.seed(167)
theta <- rnorm(M, 0, 1)
a <- rlnorm(N, 0, 0.25)
b <- rnorm(N, 0, 1)
g <- rep(0, N)
u <- runif(N, 0.8, 0.9)
probs <- matrix(g, M, N, byrow = TRUE) + matrix(u - g, M, N, byrow = TRUE) *
  plogis(matrix(a, M, N, byrow = TRUE) * outer(theta, b, "-"))
resp2 <- (probs > matrix(runif(M * N, 0, 1), M, N)) + 0
all.equal(resp2, Sim3PL$resp2, check.attributes = FALSE)



