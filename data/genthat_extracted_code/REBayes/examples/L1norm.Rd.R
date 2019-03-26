library(REBayes)


### Name: L1norm
### Title: L1norm for piecewise linear functions
### Aliases: L1norm
### Keywords: utility

### ** Examples


# Make a random step (distribution) function with Gaussian knots
rstep <- function(n){
        x <- sort(rnorm(n))
        y <- runif(n)
        y <- c(0,cumsum(y/sum(y)))
        stepfun(x,y)
        }
F <- rstep(20)
G <- rstep(10)
S <- L1norm(F,G)
plot(F,main = paste("||F - G|| = ", round(S,4)))
lines(G,col = 2)




