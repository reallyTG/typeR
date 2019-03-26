library(rvinecopulib)


### Name: rvinecopulib
### Title: High Performance Algorithms for Vine Copula Modeling
### Aliases: rvinecopulib rvinecopulib-package
### Keywords: package

### ** Examples

## bicop_dist objects
bicop_dist("gaussian", 0, 0.5)
str(bicop_dist("gauss", 0, 0.5))
bicop <- bicop_dist("clayton", 90, 3)

## bicop objects
u <- rbicop(500, "gauss", 0, 0.5)
fit1 <- bicop(u, "par")
fit1

## vinecop_dist objects
## specify pair-copulas
bicop <- bicop_dist("bb1", 90, c(3, 2))
pcs <- list(
    list(bicop, bicop),  # pair-copulas in first tree 
    list(bicop)          # pair-copulas in second tree 
)
## specify R-vine matrix
mat <- matrix(c(1, 2, 3, 1, 2, 0, 1, 0, 0), 3, 3) 
## build the vinecop_dist object
vc <- vinecop_dist(pcs, mat)
summary(vc)

## vinecop objects
u <- sapply(1:3, function(i) runif(50))
vc <- vinecop(u, "par")
summary(vc)

## vine_dist objects
vc <- vine_dist(list(distr = "norm"), pcs, mat)
summary(vc)

## vine objects
x <- sapply(1:3, function(i) rnorm(50))
vc <- vine(x, copula_controls = list(family_set = "par"))
summary(vc)



