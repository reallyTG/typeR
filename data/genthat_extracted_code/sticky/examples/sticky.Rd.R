library(sticky)


### Name: sticky
### Title: sticky
### Aliases: sticky unstick unsticky is.sticky sticky_all

### ** Examples


  x <- 1:5
  attr(x, 'foo') <- 'bar'
  x <- x[1:3]
  attr(x,'foo')            # NULL

  x <- sticky(1:5)
  attr(x, 'foo') <- 'bar'
  x_1 <- x[1:3]
  attr(x_1, 'foo')         # bar

  x_2 <- unstick(x)
  x_2 <- x[1:3]
  attr(x_2,'foo')          # NULL


  is.sticky(x)             # TRUE




