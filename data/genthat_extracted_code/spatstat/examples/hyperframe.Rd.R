library(spatstat)


### Name: hyperframe
### Title: Hyper Data Frame
### Aliases: hyperframe
### Keywords: spatial manip

### ** Examples

 # equivalent to a data frame
  hyperframe(X=1:10, Y=3)

 # list of functions
  hyperframe(f=list(sin, cos, tan))

 # table of functions and matching expressions
  hyperframe(f=list(sin, cos, tan),
             e=list(expression(sin(x)), expression(cos(x)), expression(tan(x))))

  hyperframe(X=1:10, Y=letters[1:10], Z=factor(letters[1:10]),
    stringsAsFactors=FALSE)

  lambda <- runif(4, min=50, max=100)
  X <- lapply(as.list(lambda), function(x) { rpoispp(x) })
  h <- hyperframe(lambda=lambda, X=X)
  h

  h$lambda2 <- lambda^2
  h[, "lambda3"] <- lambda^3
  h[, "Y"] <- X



