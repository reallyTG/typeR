library(pracma)


### Name: sumalt
### Title: Alternating Series Acceleration
### Aliases: sumalt
### Keywords: math

### ** Examples

# Beispiel: Leibniz-Reihe 1 - 1/3 + 1/5 - 1/7 +- ...
a_pi4 <- function(k) (-1)^k / (2*k + 1)
sumalt(a_pi4, 20)  # 0.7853981633974484 = pi/4 + eps()

# Beispiel: Van Wijngaarden transform needs 60 terms
n <- 60; N <- 0:n
a <- cumsum((-1)^N / (2*N+1))
for (i in 1:n) {
    a <- (a[1:(n-i+1)] + a[2:(n-i+2)]) / 2
}
a - pi/4  # 0.7853981633974483

# Beispiel: 1 - 1/2^2 + 1/3^2 - 1/4^2 +- ...
b_alt <- function(k) (-1)^k / (k+1)^2
sumalt(b_alt, 20)  # 0.8224670334241133 = pi^2/12 + eps()

## Not run: 
##D # Dirichlet eta() function: eta(s) = 1/1^s - 1/2^s + 1/3^s -+ ...
##D   eta_ <- function(s) {
##D     eta_alt <- function(k) (-1)^k / (k+1)^s
##D     sumalt(eta_alt, 30)
##D   }
##D   eta_(1)                       # 0.6931471805599453 = log(2)
##D   abs(eta_(1+1i) - eta(1+1i))   # 1.24e-16
## End(Not run)



