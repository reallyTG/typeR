library(Runuran)


### Name: ur
### Title: Sample from a distribution specified by a "unuran" object
### Aliases: ur unuran.sample
### Keywords: distribution datagen

### ** Examples

## Draw random sample of size 10 from normal distribution using
## method 'TDR'
unr <- unuran.new("normal","tdr")
x <- ur(unr,n=10)



