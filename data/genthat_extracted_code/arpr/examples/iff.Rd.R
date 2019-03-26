library(arpr)


### Name: iff
### Title: Apply a function if and only if test is TRUE
### Aliases: iff iffn iffelse

### ** Examples

require(magrittr)
x <- sample(c(1,2,NA), 1)
x <- x %>%
  iff(is.na, const(0))
y <- x%>%
  iff(x <= 0, function(x) { x - 2 })

x <- sample(c(1,2,NA), 1)
x %>%
  iffn(is.na, exp)




