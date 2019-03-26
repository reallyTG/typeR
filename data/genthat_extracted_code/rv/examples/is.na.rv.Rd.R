library(rv)


### Name: is.na.rv
### Title: Missing Data Indicators
### Aliases: is.na.rv rv.all.na rv.any.na
### Keywords: classes

### ** Examples

  x <- trunc(rvnorm(1))
  y <- !(x==0 & NA) # TRUE if x!=0
  x <- y*x
  is.na(x)     # 69%: Pr(-1<Z<1)
  is.logical(is.na(x)) # TRUE
  rv.any.na(x) # TRUE
  rv.all.na(x) # FALSE
  



