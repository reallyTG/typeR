library(Runuran)


### Name: udbinom
### Title: UNU.RAN object for Binomial distribution
### Aliases: udbinom
### Keywords: distribution

### ** Examples

## Create distribution object for Binomial distribution
dist <- udbinom(size=100, prob=0.33)
## Generate generator object; use method DGT (inversion)
gen <- dgtd.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




