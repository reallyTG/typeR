library(mvp)


### Name: ooom
### Title: One over one minus a multivariate polynomial
### Aliases: ooom

### ** Examples

ooom("x",5)
ooom("x",5) * as.mvp("1-x")  # zero through fifth order


ooom("x+y",4)

"x+y" %>% ooom(5) %>% `-`(1) %>% ooom(3)




