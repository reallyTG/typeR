library(icamix)


### Name: ATRANSDENSITY
### Title: ATRANSDENSITY
### Aliases: ATRANSDENSITY
### Keywords: ~kwd1 ~kwd2

### ** Examples

## An example that evaluates the 2-D uniform distribution on a linear transformation of [1,3]x[1,3]
## f1ind is the density of the uniform distribution on [1,3]^r
f1ind <- function(grid){# mixture component 1 original signal density function
  n <- ncol(grid)
  r <- nrow(grid)
  answer <- rep(1,n)
  for(i in 1:n){
    for(j in 1:r){
      answer[i] <- answer[i] * (grid[j,i] >= 1 & grid[j,i] <= 3) / 2
    }
  }
  answer
}

A <- matrix(c(6, 9, -12, 15), 2, 2, byrow = FALSE)

gridpoints <- t(as.matrix(expand.grid(seq(-32,12,2),seq(18,80,2))))

f1trans <- ATRANSDENSITY(gridpoints, A, f1ind)

plot(t(gridpoints),col=(f1trans>0))



