library(pracma)


### Name: nchoosek
### Title: Binomial Coefficients
### Aliases: nchoosek
### Keywords: arith

### ** Examples

S <- sapply(0:6, function(k) nchoosek(6, k))  # 1  6 15 20 15  6  1

# Catalan numbers
catalan <- function(n) choose(2*n, n)/(n+1)
catalan(0:10)
# 1  1  2  5  14  42  132  429  1430  4862  16796

# Relations
n <- 10
sum((-1)^c(0:n) * sapply(0:n, function(k) nchoosek(n, k)))  # 0



