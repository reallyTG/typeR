library(NMOF)


### Name: SAopt
### Title: Optimisation with Simulated Annealing
### Aliases: SAopt
### Keywords: optimize

### ** Examples

## Aim: given a matrix x with n rows and 2 columns,
##      divide the rows of x into two subsets such that
##      in one subset the columns are highly correlated,
##      and in the other lowly (negatively) correlated.
##      constraint: a single subset should have at least 40 rows

## create data with specified correlation
n <- 100L
rho <- 0.7
C <- matrix(rho, 2L, 2L); diag(C) <- 1
x <- matrix(rnorm(n * 2L), n, 2L) %*% chol(C)

## collect data
data <- list(x = x, n = n, nmin = 40L)

## a random initial solution
x0 <- runif(n) > 0.5

## a neighbourhood function
neighbour <- function(xc, data) {
    xn <- xc
    p <- sample.int(data$n, size = 1L)
    xn[p] <- abs(xn[p] - 1L)
    # reject infeasible solution
    c1 <- sum(xn) >= data$nmin
    c2 <- sum(xn) <= (data$n - data$nmin)
    if (c1 && c2) res <- xn else res <- xc
    as.logical(res)
}

## check (should be 1 FALSE and n-1 TRUE)
x0 == neighbour(x0, data)

## objective function
OF <- function(xc, data)
    -abs(cor(data$x[xc, ])[1L, 2L] - cor(data$x[!xc, ])[1L, 2L])

## check
OF(x0, data)
## check
OF(neighbour(x0, data), data)

## plot data
par(mfrow = c(1,3), bty = "n")
plot(data$x,
     xlim = c(-3,3), ylim = c(-3,3),
     main = "all data", col = "darkgreen")

## *Local Search*
algo <- list(nS = 3000L,
             neighbour = neighbour,
             x0 = x0,
             printBar = FALSE)
sol1 <- LSopt(OF, algo = algo, data=data)
sol1$OFvalue

## *Simulated Annealing*
algo$nT <- 10L
algo$nS <- ceiling(algo$nS/algo$nT)
sol <- SAopt(OF, algo = algo, data = data)
sol$OFvalue

c1 <- cor(data$x[ sol$xbest, ])[1L, 2L]
c2 <- cor(data$x[!sol$xbest, ])[1L, 2L]

lines(data$x[ sol$xbest, ], type = "p", col = "blue")

plot(data$x[ sol$xbest, ], col = "blue",
     xlim = c(-3, 3), ylim = c(-3, 3),
     main = paste("subset 1, corr.", format(c1, digits = 3)))

plot(data$x[!sol$xbest, ], col = "darkgreen",
     xlim = c(-3,3), ylim = c(-3,3),
     main = paste("subset 2, corr.", format(c2, digits = 3)))

## compare LS/SA
par(mfrow = c(1, 1), bty = "n")
plot(sol1$Fmat[ , 2L],type = "l", ylim=c(-1.5, 0.5),
     ylab = "OF", xlab = "Iterations")
lines(sol$Fmat[ , 2L],type = "l", col = "blue")
legend(x = "topright", legend = c("LS", "SA"),
       lty = 1, lwd = 2, col = c("black", "blue"))



