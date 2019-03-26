library(actuar)


### Name: ZeroModifiedGeometric
### Title: The Zero-Modified Geometric Distribution
### Aliases: ZeroModifiedGeometric Zmgeometric dzmgeom pzmgeom qzmgeom
###   rzmgeom
### Keywords: distribution

### ** Examples

p <- 1/(1 + 0.5)
dzmgeom(1:5, prob = p, p0 = 0.6)
(1-0.6) * dgeom(1:5, p)/pgeom(0, p, lower = FALSE) # same

## simple relation between survival functions
pzmgeom(0:5, p, p0 = 0.2, lower = FALSE)
(1-0.2) * pgeom(0:5, p, lower = FALSE)/pgeom(0, p, lower = FALSE) # same

qzmgeom(pzmgeom(0:10, 0.3, p0 = 0.6), 0.3, p0 = 0.6)



