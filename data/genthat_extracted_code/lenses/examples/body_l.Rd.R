library(lenses)


### Name: body_l
### Title: Body lens
### Aliases: body_l
### Keywords: datasets

### ** Examples

inc2 <- function(x) x + 2
view(inc2, body_l)
inc4 <- set(inc2, body_l, quote(x + 4))
inc4(10)



