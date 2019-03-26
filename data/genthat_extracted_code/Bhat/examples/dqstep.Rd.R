library(Bhat)


### Name: dqstep
### Title: step size generator
### Aliases: dqstep
### Keywords: optimize iteration

### ** Examples

  ## Rosenbrock Banana function
   fr <- function(x) {
         x1 <- x[1]
         x2 <- x[2]
         100 * (x2 - x1 * x1)^2 + (1 - x1)^2
    }
  ## define
   x <- list(label=c("a","b"),est=c(1,1),low=c(0,0),upp=c(100,100))
   dqstep(x,fr,sens=1)



