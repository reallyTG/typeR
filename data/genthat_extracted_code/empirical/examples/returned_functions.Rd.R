library(empirical)


### Name: returned_functions
### Title: Returned Functions
### Aliases: epdfuv.f ecdfuv.f ecdfuv.f.inverse epdfmv.f ecdfmv.f

### ** Examples

#construct an empirical quantile function and then evaluate it
#(compute the 0.25 quantile)
x = rnorm (30, 4) ^ 2
ecdfuv.f.inverse = ecdfuv.inverse (x)
ecdfuv.f.inverse (0.25)



