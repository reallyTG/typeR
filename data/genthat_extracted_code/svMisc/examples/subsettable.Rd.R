library(svMisc)


### Name: subsettable
### Title: Define a function as being 'subsettable' using $ operator
### Aliases: subsettable $.subsettable_type $.subsettable_which
### Keywords: utilities

### ** Examples

foo <- structure(function(x, type = c("histogram", "boxplot"), ...) {
  type <- match.arg(type, c("histogram", "boxplot"))
  switch(type,
    histogram = hist(x, ...),
    boxplot = boxplot(x, ...),
    stop("unknow type")
  )
}, class = c("function", "subsettable_type"))
foo

# This function can be used as usual:
foo(rnorm(50), type = "histogram")
# ... but also this way:
foo$histogram(rnorm(50))
foo$boxplot(rnorm(50))



