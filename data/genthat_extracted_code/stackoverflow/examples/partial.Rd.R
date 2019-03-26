library(stackoverflow)


### Name: partial
### Title: Partially apply a function
### Aliases: partial

### ** Examples

# Example 1:
f <- function(a, b, c, d) a+b+c+d
p <- partial(f, a=2, c=3)
p(b=0, d=1)

# captures a format string for printing out sleep data
labeller <- partial(sprintf, fmt="extra=%3.2f, group=%d, ID=%d")
do.call(labeller, sleep[1, , drop=FALSE])




