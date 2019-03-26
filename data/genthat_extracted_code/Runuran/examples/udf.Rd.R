library(Runuran)


### Name: udf
### Title: UNU.RAN object for F distribution
### Aliases: udf
### Keywords: distribution

### ** Examples

## Create distribution object for F distribution
distr <- udf(df1=3,df2=6)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




