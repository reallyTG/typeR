library(elliplot)


### Name: midpoints
### Title: Quantile Summaries
### Aliases: midpoints quantile
### Keywords: utilities

### ** Examples

midpoints(1:100, 4)
midpoints(c(rnorm(100), -Inf, Inf), 3)

# define 33 number summary
thirtythreenum <- function(x, ...) midpoints(x, 5, ...)
thirtythreenum(1:100)



