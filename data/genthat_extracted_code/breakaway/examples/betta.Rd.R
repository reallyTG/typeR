library(breakaway)


### Name: betta
### Title: modelling total diversity
### Aliases: betta
### Keywords: diversity

### ** Examples
betta(c(2000, 3000, 4000, 3000), c(100, 200, 150, 180), cbind(1, c(100, 150, 100, 50)))

## handles missing data
betta(c(2000, 3000, 4000, 3000), c(100, 200, 150, NA))

## A test for heterogeneity of apples diversity estimates vs butterfly estimates
betta(c(1552,1500,884),c(305,675,205), cbind(1,c(0,0,1)))



