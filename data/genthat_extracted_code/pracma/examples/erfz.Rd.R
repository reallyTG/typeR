library(pracma)


### Name: erf
### Title: Error Functions and Inverses (Matlab Style)
### Aliases: erf erfinv erfc erfcinv erfcx erfz erfi
### Keywords: stat

### ** Examples

  x <- 1.0
  erf(x); 2*pnorm(sqrt(2)*x) - 1
# [1] 0.842700792949715
# [1] 0.842700792949715
  erfc(x); 1 - erf(x); 2*pnorm(-sqrt(2)*x)
# [1] 0.157299207050285
# [1] 0.157299207050285
# [1] 0.157299207050285
  erfz(x)
# [1] 0.842700792949715
  erfi(x)
# [1] 1.650425758797543



