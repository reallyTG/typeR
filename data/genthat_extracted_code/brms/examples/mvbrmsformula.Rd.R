library(brms)


### Name: mvbrmsformula
### Title: Set up a multivariate model formula for use in 'brms'
### Aliases: mvbrmsformula mvbf

### ** Examples

bf1 <- bf(y1 ~ x + (1|g))
bf2 <- bf(y2 ~ s(z))
mvbf(bf1, bf2)




