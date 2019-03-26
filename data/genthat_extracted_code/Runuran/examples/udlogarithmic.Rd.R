library(Runuran)


### Name: udlogarithmic
### Title: UNU.RAN object for Logarithmic distribution
### Aliases: udlogarithmic
### Keywords: distribution

### ** Examples

## Create distribution object for Logarithmic distribution
dist <- udlogarithmic(shape=0.3)
## Generate generator object; use method DARI
gen <- darid.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




