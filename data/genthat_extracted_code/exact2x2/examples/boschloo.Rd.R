library(exact2x2)


### Name: boschloo
### Title: Boschloo's test for 2x2 Tables
### Aliases: boschloo
### Keywords: htest

### ** Examples

# defaults to the central two-sided version
boschloo(1,5,6,7)
boschloo(1,5,6,7,alternative="greater")
## traditional two-sided Boschloo test (not central!)
boschloo(1,5,6,7, tsmethod="minlike")



