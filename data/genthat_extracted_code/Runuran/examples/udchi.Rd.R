library(Runuran)


### Name: udchi
### Title: UNU.RAN object for Chi distribution
### Aliases: udchi
### Keywords: distribution

### ** Examples

## Create distribution object for chi-squared distribution
distr <- udchi(df=5)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




