library(vsn)


### Name: vsn
### Title: Class to contain result of a vsn fit
### Aliases: class:vsn vsn-class [,vsn-method dim,vsn-method
###   nrow,vsn-method ncol,vsn-method show,vsn-method exprs,vsn-method
###   coef,vsn-method coefficients,vsn-method
### Keywords: classes

### ** Examples

  data("kidney")
  v = vsn2(kidney)
  show(v)
  dim(v)
  v[1:10, ]



