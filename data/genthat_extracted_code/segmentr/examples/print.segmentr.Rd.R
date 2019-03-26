library(segmentr)


### Name: print.segmentr
### Title: Print a segmentr object
### Aliases: print.segmentr

### ** Examples

make_segment <- function(n, p) matrix(rbinom(100 * n, 1, p), nrow = 100)
data <- cbind(make_segment(5, 0.1), make_segment(10, 0.9), make_segment(2, 0.1))
mean_lik <- function(X) abs(mean(X) - 0.5) * ncol(X)^2
x <- segment(data, likelihood = mean_lik, algorithm = "hieralg")
print(x)



