library(kantorovich)


### Name: kantorovich
### Title: Kantorovich distance
### Aliases: kantorovich

### ** Examples

mu <- c(1/7, 2/7, 4/7)
nu <- c(1/4, 1/4, 1/2)
kantorovich(mu, nu)
library(gmp)
mu <- as.bigq(c(1,2,4), 7)
nu <- as.bigq(c(1,1,1), c(4,4,2))
kantorovich(mu, nu)
mu <- c("1/7", "2/7", "4/7")
nu <- c("1/4", "1/4", "1/2")
kantorovich(mu, nu, details=TRUE)




