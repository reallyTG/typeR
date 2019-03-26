library(Runuran)


### Name: udt
### Title: UNU.RAN object for Student t distribution
### Aliases: udt
### Keywords: distribution

### ** Examples

## Create distribution object for t distribution
distr <- udt(df=4)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




