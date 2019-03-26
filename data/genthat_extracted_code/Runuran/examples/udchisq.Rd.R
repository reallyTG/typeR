library(Runuran)


### Name: udchisq
### Title: UNU.RAN object for Chi-Squared distribution
### Aliases: udchisq
### Keywords: distribution

### ** Examples

## Create distribution object for chi-squared distribution
distr <- udchisq(df=5)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




