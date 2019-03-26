library(CompQuadForm)


### Name: liu
### Title: Liu's method
### Aliases: liu
### Keywords: distribution htest

### ** Examples

# Some results from Liu et al. (2009)
# Q1 from Liu et al.
round(liu(2, c(0.5, 0.4, 0.1), c(1, 2, 1), c(1, 0.6, 0.8)), 6)
round(liu(6, c(0.5, 0.4, 0.1), c(1, 2, 1), c(1, 0.6, 0.8)), 6)
round(liu(8, c(0.5, 0.4, 0.1), c(1, 2, 1), c(1, 0.6, 0.8)), 6)

# Q2 from Liu et al.
round(liu(1, c(0.7, 0.3), c(1, 1), c(6, 2)), 6)
round(liu(6, c(0.7, 0.3), c(1, 1), c(6, 2)), 6)
round(liu(15, c(0.7, 0.3), c(1, 1), c(6, 2)), 6)

# Q3 from Liu et al.
round(liu(2, c(0.995, 0.005), c(1, 2), c(1, 1)), 6)
round(liu(8, c(0.995, 0.005), c(1, 2), c(1, 1)), 6)
round(liu(12, c(0.995, 0.005), c(1, 2), c(1, 1)), 6)

# Q4 from Liu et al.
round(liu(3.5, c(0.35, 0.15, 0.35, 0.15), c(1, 1, 6, 2), c(6, 2, 6, 2)),
6)
round(liu(8, c(0.35, 0.15, 0.35, 0.15), c(1, 1, 6, 2), c(6, 2, 6, 2)), 6)
round(liu(13, c(0.35, 0.15, 0.35, 0.15), c(1, 1, 6, 2), c(6, 2, 6, 2)), 6)




