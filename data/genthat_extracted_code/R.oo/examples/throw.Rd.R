library(R.oo)


### Name: throw
### Title: Throws an Exception
### Aliases: throw.default throw
### Keywords: error

### ** Examples

  rbern <- function(n=1, prob=1/2) {
    if (prob < 0 || prob > 1)
      throw("Argument 'prob' is out of range: ", prob)
    rbinom(n=n, size=1, prob=prob)
  }

  rbern(10, 0.4)
  # [1] 0 1 0 0 0 1 0 0 1 0
  tryCatch(rbern(10, 10*0.4),
    error=function(ex) {}
  )



