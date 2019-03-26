library(pracma)


### Name: brentDekker
### Title: Brent-Dekker Root Finding Algorithm
### Aliases: brentDekker brent
### Keywords: math

### ** Examples

# Legendre polynomial of degree 5
lp5 <- c(63, 0, -70, 0, 15, 0)/8
f <- function(x) polyval(lp5, x)
brent(f, 0.6, 1)                # 0.9061798459 correct to 12 places



