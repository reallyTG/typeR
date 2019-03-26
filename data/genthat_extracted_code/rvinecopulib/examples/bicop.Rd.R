library(rvinecopulib)


### Name: bicop
### Title: Bivariate copula models
### Aliases: bicop bicop_dist bicop_dist

### ** Examples

## bicop_dist objects
bicop_dist("gaussian", 0, 0.5)
str(bicop_dist("gauss", 0, 0.5))
bicop <- bicop_dist("clayton", 90, 3)

## bicop objects
u <- rbicop(500, "gauss", 0, 0.5)
fit1 <- bicop(u, "par")
fit1




