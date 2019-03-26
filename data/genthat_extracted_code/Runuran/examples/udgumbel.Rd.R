library(Runuran)


### Name: udgumbel
### Title: UNU.RAN object for Gumbel distribution
### Aliases: udgumbel
### Keywords: distribution

### ** Examples

## Create distribution object for Gumbel distribution
distr <- udgumbel()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




