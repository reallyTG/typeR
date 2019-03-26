library(XVector)


### Name: XDoubleViews-class
### Title: The XDoubleViews class
### Aliases: class:XDoubleViews XDoubleViews-class XDoubleViews
###   Views,XDouble-method Views,numeric-method show,XDoubleViews-method
###   ==,XDoubleViews,XDoubleViews-method ==,XDoubleViews,XDouble-method
###   ==,XDoubleViews,numeric-method ==,XDouble,XDoubleViews-method
###   ==,numeric,XDoubleViews-method
### Keywords: methods classes

### ** Examples

  ## One standard way to create an XDoubleViews object is to use
  ## the Views() constructor:
  subject <- as(rnorm(6), "XDouble")
  v4 <- Views(subject, start=3:0, end=5:8)
  v4
  subject(v4)
  length(v4)
  start(v4)
  end(v4)
  width(v4)

  ## Attach a comment to views #3 and #4:
  names(v4)[3:4] <- "out of limits"
  names(v4)

  ## A more programatical way to "tag" the "out of limits" views:
  idx <- start(v4) < 1 | end(v4) > length(subject(v4))
  names(v4)[idx] <- "out of limits"

  ## Extract a view as an XDouble object:
  v4[[2]]

  ## It is an error to try to extract an "out of limits" view:
## Not run: 
##D   v4[[3]] # Error!
## End(Not run)

  ## Here the first view doesn't even overlap with the subject:
  subject <- as(c(97, 97, 97, 45, 45, 98), "XDouble")
  Views(subject, start=-3:4, end=-3:4 + c(3:6, 6:3))

  ## Some fast view* functionalities:
  x <- rnorm(55)
  bounds <- IRanges(c(1, 11, 35, 20), width=c(5, 10, 15, 28))
  v <- Views(x, bounds)
  val <- viewMins(v)
  expect <- sapply(1:length(bounds), function(i) {
    min(x[start(bounds)[i]:end(bounds[i])])
  })
  stopifnot(all(val == expect))



