library(phylogram)


### Name: remidpoint
### Title: Set dendrogram attributes for a nested list.
### Aliases: remidpoint

### ** Examples

  ## manually create a small dendrogram with three members, A, B and C
  x <- list("A", list("B", "C"))
  attr(x[[1]], "leaf") <- TRUE
  attr(x[[2]][[1]], "leaf") <- TRUE
  attr(x[[2]][[2]], "leaf") <- TRUE
  attr(x[[1]], "label") <- "A"
  attr(x[[2]][[1]], "label") <- "B"
  attr(x[[2]][[2]], "label") <- "C"
  attr(x, "height") <- 1
  attr(x[[1]], "height") <- 0
  attr(x[[2]], "height") <- 0.5
  attr(x[[2]][[1]], "height") <- 0
  attr(x[[2]][[2]], "height") <- 0
  x <- remidpoint(x)
  class(x) <- "dendrogram"
  plot(x, horiz = TRUE)



