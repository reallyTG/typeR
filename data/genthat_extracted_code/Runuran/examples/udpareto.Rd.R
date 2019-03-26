library(Runuran)


### Name: udpareto
### Title: UNU.RAN object for Pareto distribution
### Aliases: udpareto
### Keywords: distribution

### ** Examples

## Create distribution object for Pareto distribution
distr <- udpareto(k=3,a=2)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




