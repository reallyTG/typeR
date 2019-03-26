library(Runuran)


### Name: udlogis
### Title: UNU.RAN object for Logistic distribution
### Aliases: udlogis
### Keywords: distribution

### ** Examples

## Create distribution object for standard logistic distribution
distr <- udlogis()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




