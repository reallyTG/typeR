library(qrjoint)


### Name: chull.center
### Title: Fast Interior Point Center of Multivariate Data
### Aliases: chull.center
### Keywords: programming

### ** Examples
 
p <- 9
n <- 200
u <- runif(n)
require(splines)
x <- bs(u, df = p)
chull.center(x, plot = TRUE)



