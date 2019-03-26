library(Runuran)


### Name: udnbinom
### Title: UNU.RAN object for Negative Binomial distribution
### Aliases: udnbinom
### Keywords: distribution

### ** Examples

## Create distribution object for Negative Binomial distribution
dist <- udnbinom(size=100, prob=0.33)
## Generate generator object; use method DARI
gen <- darid.new(dist)
## Draw a sample of size 100
x <- ur(gen,100)




