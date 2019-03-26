library(Runuran)


### Name: udgeom
### Title: UNU.RAN object for Geometric distribution
### Aliases: udgeom
### Keywords: distribution

### ** Examples

## Create distribution object for Geometric distribution
dist <- udgeom(prob=0.33)
## Generate generator object; use method DARI
gen <- darid.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




