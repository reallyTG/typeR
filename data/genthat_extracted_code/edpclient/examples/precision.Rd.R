library(edpclient)


### Name: precision
### Title: Precisions
### Aliases: precision precision<-

### ** Examples

  d <- data.frame(x = c(1.0, 2.5, -2.5), y = runif(3))
  precision(d$x) <- c(1, 2)
  px <- precision(d$x)  # returns c(1, 2)
  py <- precision(d$y)  # returns NULL
  ## Don't show: 
    stopifnot(all.equal(px, c(1, 2)))
    stopifnot(is.null(py))
  
## End(Don't show)



