library(emplik)


### Name: el.trun.test
### Title: Empirical likelihood ratio for mean with left truncated data
### Aliases: el.trun.test
### Keywords: nonparametric survival htest

### ** Examples

## example with tied observations
vet <- c(30, 384, 4, 54, 13, 123, 97, 153, 59, 117, 16, 151, 22, 56, 21, 18,
         139, 20, 31, 52, 287, 18, 51, 122, 27, 54, 7, 63, 392, 10)
vetstart <- c(0,60,0,0,0,33,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
el.trun.test(vetstart, vet, mu=80, maxit=15)



