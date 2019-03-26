library(ecd)


### Name: ecld.solve
### Title: Analytic solution for y(x) in lambda distribution
### Aliases: ecld.solve ecld.laplace_B ecld.solve_quartic
###   ecld.solve_by_poly ecld.solve_isomorphic
### Keywords: solve

### ** Examples

ld <- ecld(sigma=0.01*ecd.mp1)
x <- seq(-0.1, 0.1, by=0.01)
ecld.solve(ld,x)



