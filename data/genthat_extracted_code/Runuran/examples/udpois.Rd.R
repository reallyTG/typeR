library(Runuran)


### Name: udpois
### Title: UNU.RAN object for Poisson distribution
### Aliases: udpois
### Keywords: distribution

### ** Examples

## Create distribution object for Poisson distribution
dist <- udpois(lambda=2.3)
## Generate generator object; use method DARI
gen <- darid.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




